server {
    listen       80;
    listen       443 ssl;
    server_name  nginx-repo;

    access_log /var/log/nginx/access.log;
    error_log  /var/log/nginx/error.log;

    location / {
    root   /;
    index  index.html index.htm;
    }
    location / {
        try_files $uri $uri/ =404;
    }
}
