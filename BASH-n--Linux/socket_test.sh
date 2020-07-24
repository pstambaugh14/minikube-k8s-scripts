probe kernel.function("unix_stream_sendmsg") {
  if ($sock->sk != $1) next # comment out this line if you want systemwide rather than per-socket tracing

  printf("%d %s %p ", pid(), execname(), $sock->sk)

  len = 0
  for (i = 0; i < $msg->msg_iovlen; i++)
    len += $msg->msg_iov[i]->iov_len

  printf("%d [", len)

  for (i = 0; i < $msg->msg_iovlen; i++)
    printf("%s", user_buffer_printable($msg->msg_iov[i]->iov_base, $msg->msg_iov[i]->iov_len))

  printf("] [")

  for (i = 0; i < $msg->msg_iovlen; i++)
    printf("%s", user_buffer_hexdump($msg->msg_iov[i]->iov_base, $msg->msg_iov[i]->iov_len))

  printf("]\n")
}

/* The following stuff will be copied into the standard tapset, at which point 
 * it can be removed from this script, and you will not need "-g" (guru mode) to run it.
 */

# function user_buffer_raw:string (addr:long, size:long) { return _user_buffer (addr, size, 0) }
function user_buffer_printable:string (addr:long, size:long) { return _user_buffer (addr, size, 1) }
function user_buffer_hexdump:string (addr:long, size:long) { return _user_buffer (addr, size, 2) }

function _user_buffer:string (addr:long, size:long, mode:long) %{ /* pure */
  size_t i;
  long rc = 0;
  char byte;
  char *output = THIS->__retvalue;
  size_t limit = (THIS->mode == 2 ? MAXSTRINGLEN/2 : MAXSTRINGLEN) - 1;
  for (i = 0; i < THIS->size && i < limit && rc >= 0; i++) {
    rc = _stp_strncpy_from_user (& byte, (const char __user*) (uintptr_t)(THIS->addr+i), 1);
    if (rc < 0) break;
    if (THIS->mode == 0) *output++ = byte;
    else if (THIS->mode == 1) *output++ = ((byte >= 32 && byte < 127) ? byte : '.');
    else if (THIS->mode == 2) { *output++ = "0123456789ABCDEF"[(byte >> 4) & 0x0f];
                                *output++ = "0123456789ABCDEF"[byte & 0x0f]; }
  }
  *output = '\0';
%}
