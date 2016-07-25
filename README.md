Freifunk Kiel - gluon-packages
============================

### gluon-config-mode-contact-obligatory

Set a custom string as owner contact that will be distributed in the mesh. 
You can define that the owner contact field is obligatory with the following 
code in your `site.conf`:

    owner = {
        obligatory = true
    },

This package Replaces the standard gluon-package `gluon-config-mode-contact-info`

### gluon-config-mode-usb-media

Enable USB media automount in config mode and set the 
web path to access it via http://[IPv6]

### gluon-usb-media

Automatically mount your USB media in the configured web path
in gluon-config-mode-usb-media if "Enable USB media" is set to truew

# site-config

In the folder `.site-examples` there are some examples, how to include these packages

# build examples

## update all

    make update

### quick check for errors before build

    make prepare-target V=s

### quick check for errors in build for only one package

    make package/gluon-config-mode-contact-obligatory/compile V=s

### build  target ar71xx-generic

    make GLUON_TARGET=ar71xx-generic V=s DEFAULT_GLUON_RELEASE = 2016.1.5~exp$(shell date '+%y%m%d%H%M')+usb-mount          