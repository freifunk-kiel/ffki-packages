local cbi = require "luci.cbi"
local i18n = require "gluon.util"
local uci = require("simple-uci").cursor()

local M = {}

function M.section(form)
  local s = form:section(cbi.SimpleSection, nil, translate(
    'If you want to share your attached USB storage devices, '
      .. 'here you can enable this and specify the visible path in '
      .. 'the URL of your Node.'))


  local o

  o = s:option(Flag, "usbmediasharing", translate("Share your devices"))
  o.default = uci:get("gluon-usb-media", "settings", "share_device", o.disabled)
  o.optional = false

  o = s:option(Value, "usbmediapath", translate("Path"))
  o.default = uci:get("gluon-usb-media", "settings", "path")
  o:depends("_usbmediasharing", "1")
  o.optional = false
  o.datatype = "hostname"
  o.description = translatef("e.g. %s", "media")

end

function M.handle(data)

  uci:section('gluon-usb-media', 'gluon-usb-media', 'settings',
            {
                    share_device = data._usbmediasharing,
            }
  )
  if data._usbmediasharing and data._usbmediapath ~= nil then
    uci:section('gluon-usb-media', 'gluon-usb-media', 'settings',
	    {
		    path = data._usbmediapath,
	    }
    )
  end
  uci:save("gluon-usb-media")
  uci:commit("gluon-usb-media")
end

return M
