# Linux From Scratch
## By Giovanni Santini
```
              a8888b.
             d888888b.
             8P"YP"Y88
             8|o||o|88
             8'    .88
             8`._.' Y8.
            d/      `8b.
          .dP   .     Y8b.
         d8:'   "   `::88b.
        d8"           `Y88b
       :8P     '       :888
        8a.    :      _a88P
      ._/"Yaa_ :    .| 88P|
 jgs  \    YP"      `| 8P  `.
 a:f  /     \._____.d|    .'
      `--..__)888888P`._.'
```

Managing a complete linux system from scratch
can be quite the challenge. Thankfully the 
FLS and BLFS project exist to give a tremendous
hand to the people brave enough to use a LFS
system daily.

This directory, located at `/lfs` contains
information about my personal linux system,
config files, tips and tricks to make my life
easier. To install the config files, I just
have to run make install.

This document contains the following sections:
- overview of the system
- users
- package management: how I handle packages
- network
- config files: a list of useful config files

# Overview of the system

This system was first built the 31/08/2024,
with Linux-6.10.5 following LFS 12.2.
The installed firmware is tag 20241017.

Note the following directories:
- `/sources`: important source files such as
  the linux kernel are kept here, accessible
  by any user
- `/lfs`: system documentation
- `/boot`: linux boot, containing the kernel
  bzImage and the config file used to build
  the latest kernel.
- `/boot/efi`: mount point of the efi partition
- `/lib/firmware`: firmware programs

# Users

The system has 3 users:
- root: privileged user
- santo: regular user in the wheel group
- lanto: unprivileged user without access to sudo

# Package Management

A list of installed packages is located in
`/lfs/installed.lfs`. I am working on a
package manager, mapkg, for the most important
packages that I want to upgrade when a new
version comes out.

# Network

The firmware needs rtw88/ for wifi support,
which are build inside the kernel. Support
for compressed firmware is also enabled but
vould be removed. To list all PCI devices
and the kernel module they use, run lspci -k

To connect to the internet, the device must
be up first. Use "ifup <dev>" for wifi, or
"ip link set <device> up" and then "dhcpcd"
to get an ip address for ethernet.
List the network devices with "ip link show".

Public key certificates are stored in
"/etc/pki/tls/certs/ca-bundle.crt" and are
updated via "make-ca".

# Config files

### git
- ~/.gitconfig
- /etc/gitconfig 

## wpa_supplicant
- /etc/sysconfig/wpa_supplicant-wlo1.conf

## dhcpcd
- /etc/sysconfig/ifconfig.eno1
- /etc/hosts
- /etc/resolv.conf

## variables
- /etc/profile

## Devices
- /etc/sysconfig/mouse

# Tips and Tricks

List all the devices and the kernel module
associated with them:
```
lspci -k
```
Very usefult to understand what a working
system is using. If a defice is not showing
up, It might be because a kernel module is
not loaded. Check dmesg for errors.
