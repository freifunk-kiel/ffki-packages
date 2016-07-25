gluon-packages Freifunk Kiel
============================

### gluon-config-mode-contact-obligatory

Set a custom string as owner contact that will be distributed in the mesh. You can define if the owner contact field is obligatory with the following code in your `site.conf`:

    owner = {
        obligatory = true
    },

Replaces the package `gluon-config-mode-contact-info`

### gluon-config-mode-usb-media

Enable USB media automount in config mode and set the 
web path to access it via http://[IPv6]

### gluon-usb-media

Automatically mount your USB media in the configured web path
in gluon-config-mode-usb-media if "Enable USB media" is set to truew