local cbi = require "luci.cbi"
local i18n = require "luci.i18n"
local uci = luci.model.uci.cursor()
local site = require 'gluon.site_config'

local M = {}

function M.section(form)
  local s = form:section(cbi.SimpleSection, nil, i18n.translate(
    "Please accept the PPA."
    )
  )

  local o = s:option(cbi.Flag, "_ppa", i18n.translate("I agree with the PPA"))
  o.default = uci:get_first("gluon-node-info", "owner", "ppa", "")
  o.rmempty = false

  o.validate = function(self, val)
    if val == false then
      self.section.error = {
        [1] = {
          i18n.translate(
            "You didn't accept the picopeering agreement."
          )
        }
      }
    end
    return val
  end
end

function M.handle(data)
  if data._ppa ~= nil then
    uci:set("gluon-node-info", uci:get_first("gluon-node-info", "owner"), "ppa", data._ppa)
  else
    uci:delete("gluon-node-info", uci:get_first("gluon-node-info", "owner"), "ppa")
  end
  uci:save("gluon-node-info")
  uci:commit("gluon-node-info")
end

return M
