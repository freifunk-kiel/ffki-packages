local cbi = require "luci.cbi"
local i18n = require "gluon.util"
local uci = require("simple-uci").cursor()
local site = require 'gluon.site_config'

local M = {}

function M.section(form)
  local s = form:section(cbi.SimpleSection, nil, translate(
      "Please agree with the <a href=\"http://www.picopeer.net/\" target=\"_blank\">"
      .. "Picopeering Agreement (PPA)</a> and be available."
    )
  )

  local o = s:option(Flag, "ppa", translate("I agree with the PPA"))
  o.default = uci:get_first("gluon-node-info", "owner", "ppa", "")
  o.optional = false
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
