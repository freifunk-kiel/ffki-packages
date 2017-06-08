local cbi = require "luci.cbi"
local i18n = require "gluon.util"
local uci = require("simple-uci").cursor()
local site = require 'gluon.site_config'

local M = {}

function M.section(form)
  local s = form:section(cbi.SimpleSection, nil, translate(
    'Please provide your contact information here to '
      .. 'allow others to contact you. Note that '
      .. 'this information will be visible <em>publicly</em> '
      .. 'on the internet together with your node\'s coordinates.'
    )
  )

  local o = s:option(Value, "contact", translate("Contact info"))
  o.default = uci:get_first("gluon-node-info", "owner", "contact", "")
  o.optional = not site.owner.obligatory
  o.datatype = "string"
  o.description = translate("e.g. E-mail or phone number")
  o.validate = function(self, val)
    if val == nil then
      self.section.error = {
        [1] = {
          translate(
            "You didn't provide any contact information! If you really want to run your "
              .. "node anonymously, you can enter a blank here. Please tell us an alternative "
              .. "how we could contact you in case there is anything wrong with your node."
          )
        }
      }
    end
    return val
  end
  o.maxlen = 140
end

function M.handle(data)
  if data._contact ~= nil then
    uci:set("gluon-node-info", uci:get_first("gluon-node-info", "owner"), "contact", data._contact)
  else
    uci:delete("gluon-node-info", uci:get_first("gluon-node-info", "owner"), "contact")
  end
  uci:save("gluon-node-info")
  uci:commit("gluon-node-info")
end

return M
