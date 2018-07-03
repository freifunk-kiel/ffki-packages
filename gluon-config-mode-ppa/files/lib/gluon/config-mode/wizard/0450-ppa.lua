return function(form, uci)
	local s = form:section(
		Section, nil, translate(
			'I understand the <a href="http://www.picopeer.net/" target="_blank">'
				.. 'Picopeering Agreement (PPA)</a> and will be contactable.'
			)
	)	 

	local o = s:option(Flag, "ppa", translate("I understand the PPA"))
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
