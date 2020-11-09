#!/bin/bash


echo "
OVERVIEW
       "Runlevels" are an obsolete way to start and stop groups of services used in SysV init. systemd provides a compatibility layer that maps runlevels to targets, and associated binaries
       like runlevel. Nevertheless, only one runlevel can be "active" at a given time, while systemd can activate multiple targets concurrently, so the mapping to runlevels is confusing and
       only approximate. Runlevels should not be used in new code, and are mostly useful as a shorthand way to refer the matching systemd targets in kernel boot parameters.

       Table 1. Mapping between runlevels and systemd targets
       ┌─────────┬───────────────────┐
       │Runlevel │ Target            │
       ├─────────┼───────────────────┤
       │0        │ poweroff.target   │
       ├─────────┼───────────────────┤
       │1        │ rescue.target     │
       ├─────────┼───────────────────┤
       │2, 3, 4  │ multi-user.target │
       ├─────────┼───────────────────┤
       │5        │ graphical.target  │
       ├─────────┼───────────────────┤
       │6        │ reboot.target     │
       └─────────┴───────────────────┘
"

runlevel

who -r


