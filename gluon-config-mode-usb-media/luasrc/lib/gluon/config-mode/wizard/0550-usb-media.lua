return function(form, uci)
	local s = form:section(Section, nil, translate(
			'If you want to share your attached USB storage devices, ' ..
			'here you can enable this and specify the visible path in ' ..
			'the URL of your Node.'
		)
	)

	local o

	o = s:option(Flag, "usbmediasharing", translate("Share your devices"))
	o.default = uci:get("gluon-usb-media", "settings", "share_device", o.disabled)
	o.optional = false

	o = s:option(Value, "usbmediapath", translate("Path"))
	o.default = uci:get("gluon-usb-media", "settings", "path")
	-- this throws an error: o:depends("usbmediasharing", "1")
	o.optional = false
	-- without a minimal length, an empty string will be accepted even with "optional = false"
	o.datatype = "minlength(1)"
	o.description = translatef("e.g. %s", "media")
	
	function o:write(data)
		uci:section('gluon-usb-media', 'gluon-usb-media', 'settings', {
					share_device = data.usbmediasharing,
				}
			)
		if data.usbmediasharing and data.usbmediapath ~= nil then
			uci:section('gluon-usb-media', 'gluon-usb-media', 'settings', {
					path = data.usbmediapath,
				}
			)
		end
		
		if data then
			uci:set('gluon-usb-media', 'gluon-usb-media', 'settings', data)
		else
			uci:delete('gluon-usb-media', 'gluon-usb-media', 'settings')
		end
	end

	return {'gluon-usb-media'}
end
