# Todo

This file contains notes on work-in-progress
changes

## Xorg

The next step is to install Xorg libraries
and Xorg server to run emacs.

I started compilimg the dependencies for Xorg
server... and there are quite a few of them.
Going from left to right in a DFS flawor, I am now in
Xorg Fonts->xcursor-themes->xorg applications->
mesa. I have installed all mesa required
dependencies and I have to isntall the recommended
ones. I did glsland and I need the nouveau onces.

I am now installing rustc in order to use nouveau
drivers, but It uses fucking python to build and
he needs tls, which does not work. I guess not
It's finally time to troubleshoot this.
```
curl: (60) SSL certificate problem: unable to get local issuer certificate
Mor
```

I solved the SSL problems and kept installing the
dependencies. I cannot install Xorg-input-drivers
https://www.linuxfromscratch.org/blfs/view/12.2/x/x7driver.html#xorg-libinput-driver
because It depends on xorg server, but xorg
server has a recommended dependency on that...

Finally xorg works, I also installed the drivers
for the input but currently only the keyboard works.
I am really struggling to make the mouse work...

## Wifi

I should test if wifi works. I have installed
wpa_supplicant. I should try first to connect
to the hotspot of my phone, and later to
connect to the university network.

Nice so everything works, I just have to
setup SSL correctly to connect to eduroam
and unitn-x, the rest works wonderfully.
I had a hard time loading the kernel module
and the firmware for the wifi card but once
I know what I had to to it was easy...
I just looked up at which driver was used
in the live usb and enabled that, I downloaded
the firmware, extracted it, changed the
permissions and compiled it with the kernel...

It works wonderfully! I just re installed
make-ca after having a fully booted lfs.

DONE

## SSL

I should make certificates work. Maybe It's
as easy as rebooting the machine.

I will install CA certificates and hopefully
this will fix the problems. Just using make-ca
and specifying the certs path did not work
neither with curl nor wget.

DONE

## Emacs

I installed all the recommended dependencies
for emacs. Next is to install X11
EXWM does not mention any GUI such as KDE,
but is It a dependency of Emacs?

Not a problem, DONE

## Audio

Next thing is gonna be audio, with alsa

I installed alsa, configured kernel stuff,
and installed vlc. Now works and I can use
emms as a music player with vlc backend.
Sadly the quality is not that great and
I don't know how I will fix this. I will
mark this as DONE.

## Bluetooth

I want to make bluetooth work for file transfer.

I have installed BlueZ and paired with my phone
but I still cannot transfer files. Probably
I need something like Obexd or bluetooth-sendto
wich do not have instructions on blfs.

## asciidoc

I cannot install this python library because
of 
```
ssl.SSLError: [X509: NO_CERTIFICATE_OR_CRL_FOUND]
no certificate or crl found (_ssl.c:4146)
```
I have briefly investigated the issue, installed
make-ca and other troubleshooting like specifying
the certificates dir and file but I got no luck.
This also happend with another python package,
also I cannot use TLS on curl or wget so maybe
I should start from there.

## git

Git was built without documentation because
I cannot build asciidoc

## Firmware

For now I have installed the whole linux firmware
from the official release, which is about 500MB.
I could remove all the unnecessary crap after
I have something that works.

## Linux Flags

Similar to firmware, there are a number of
usless flags I acrivated during desperate times
that are not really needed. I should look at
this in the future.
hi:)
