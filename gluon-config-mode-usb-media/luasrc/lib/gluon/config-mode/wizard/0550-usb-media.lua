return function(form, uci)
	local settings = uci:get_first("gluon-usb-media", "settings")

	local s = form:section(Section, nil, pkg_i18n.translate(
			'If you want to share your attached USB storage devices, ' ..
			'here you can enable this and specify the visible path in ' ..
			'the URL of your Node.'
		)
	)

	local share_device = s:option(Flag, "settings", pkg_i18n.translate("Share your devices"))
	share_device.default = uci:get_bool("gluon-usb-media", "settings", "share_device")
	
	function share_device:write(data)
		uci:set("gluon-usb-media", "settings", "share_device", data)
	end

	local o = s:option(Value, "path", pkg_i18n.translate("Path"), pkg_i18n.translatef("e.g. %s", "media"))
	o.default = uci:get("gluon-usb-media", "settings", "path")
	o:depends(share_device, true)
	o.optional = false
	-- without a minimal length, an empty string will be accepted even with "optional = false"
	o.datatype = "minlength(1)"
	
	function o:write(data)
		uci:set("gluon-usb-media", "settings", "path", data)
	end

	return {'gluon-usb-media'}
end
