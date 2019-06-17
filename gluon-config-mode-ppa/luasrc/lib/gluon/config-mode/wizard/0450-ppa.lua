return function(form, uci)
	local pkg_i18n = i18n 'gluon-config-mode-ppa'

	local s = form:section(
		Section, nil, pkg_i18n.translate(
			'I understand the <a href="http://www.picopeer.net/" target="_blank">'
				.. 'Picopeering Agreement (PPA)</a> and I will make sure that I will '
				.. 'be reachable via the entered contact.'
			)
	)

	local o = s:option(Flag, "ppa", pkg_i18n.translate("I understand the PPA"))
	o.default = uci:get_first("gluon-node-info", "owner", "ppa", "")
	if o.default ~= nil then
			o.default = false
	end
	o.optional = false
	function o:write(data)
		uci:set("gluon-node-info", "owner", "ppa", data)
	end

	return {'gluon-node-info'}
end
