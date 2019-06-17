return function(form, uci)
	local pkg_i18n = i18n 'gluon-config-mode-contact-info-anonymous-hint'
	local site = require 'gluon.site'
	local owner = uci:get_first("gluon-node-info", "owner")
	local s = form:section(Section, nil, pkg_i18n.translate(
			'Please provide your contact information here to '
			.. 'allow others to contact you. Note that '
			.. 'this information will be visible <em>publicly</em> '
			.. 'on the internet together with your node\'s coordinates.'
		)
	)

	local o = s:option(Value, "contact", pkg_i18n.translate("Contact info"),
	pkg_i18n.translate("e.g. E-mail or phone number"))
	o.default = uci:get("gluon-node-info", owner, "contact")
	o.optional = not ((site.config_mode or {}).owner or {}).obligatory
	-- without a minimal length, an empty string will be accepted even with "optional = false"
	o.datatype = "minlength(1)"

	o.maxlen = 140

	-- validation extension, shown only if attempted to store an empty contact field and obligatory is true
	-- TODO: has no effect in 2018.x.x any more
	function o.validate(_, value, _)
		if value == nil then
			return nil, pkg_i18n.translate(
				"You didn't provide any contact information! If you really want to run your "
				.. "node anonymously, you can enter a blank here. Please tell us an alternative "
				.. "how we could contact you in case there is anything wrong with your node."
			)
		else
			return value
		end
	end

	function o:write(data)
		if data then
			uci:set("gluon-node-info", owner, "contact", data)
		else
			uci:delete("gluon-node-info", owner, "contact")
		end
	end

	return {'gluon-node-info'}
end
