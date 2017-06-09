Freifunk Kiel - gluon-packages
============================

### gluon-au-change

This package changes the autoupdater branch to stable on each update.

It should be used only for a short period of time. 

For example in case in your community you have to reset a lot of routers
back to the stable branch due to a time, where some new not completely supported
router models had to be installed with the experimental firmware.

*TODO: untested, but it should be working on builds with LEDE*

### gluon-config-mode-contact-info-anonymous-hint
This is a copy of the gluon standard package `gluon-config-mode-contact-info` 
with an extra error message hint, that you can enter space if you want to run
your node anonymously.

You have to adapt these settings in your i18n files:

This package Replaces the standard gluon-package `gluon-config-mode-contact-info`

*TODO: not working on LEDE*

### gluon-config-mode-ppa

Adds a link to the Picopeering Agreement]() and a checkbox, that will be stored in

    gluon-node-info.@owner[0].ppa='1'

This is optional, so the config mode can still be saved if the checkbox is unchecked.

*tested and working on LEDE*

### gluon-config-mode-hostname-no-pretty

Adds an extra condition, that the nodes hostname must be of the LUA type "hostname". 
This will disallow some possibilities that would be allowed since 2016.2 by the new
type `pretty_hostname`. The advantage is, that it allows you to set an invalid default
hostname in your site.conf, so the user is not allowed to use the default hostname 
suggestion any more.

This package replaces the standard gluon-package `gluon-config-mode-hostname`

*TODO: not working on LEDE*

### gluon-config-mode-usb-media

Enable USB media automount in config mode and set the web path to access it 
(default `/media/`) so the USB storage will be accessible for example via _http://\[1B46:0f:40CB::00de]/media/_

On the SSH console you can enable usb-sharing with:

    uci set gluon-usb-media.settings.share_device='1'

If you don't want to share your device under the default URL, you can change this setting with:

    uci set gluon-usb-media.settings.path='secret-path'
    
*TODO: not working on LEDE*
    
### gluon-usb-media

Automatically mount your USB media in the configured web path
in `gluon-config-mode-usb-media` if "Enable USB media" is set to true.

*TODO: untested, but it should be working on builds with LEDE*

# site-config

In the folder `.site-examples` there are some examples, how to include these packages

# build examples

## update all

    make update

### quick check for errors before build

    make prepare-target V=s

### build only one package

    make prepare-target
    make package/gluon-config-mode-contact-obligatory/compile V=s

### build target ar71xx-generic

    make GLUON_TARGET=ar71xx-generic V=s DEFAULT_GLUON_RELEASE=2016.1.5~exp$(date '+%y%m%d%H%M')+usb-mount          
