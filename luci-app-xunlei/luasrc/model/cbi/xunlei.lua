local m, s

m = Map("xunlei", translate("Xunlei"))
m.description = translate("NAS Xunlei DSM 7.x Beta Version") .. "<br/>" .. translate("Invitation code:") .. "<font color='#00bd3e'>网心超牛</font>"

m:section(SimpleSection).template = "xunlei/xunlei_status"

s = m:section(TypedSection, "xunlei")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enabled"))
o.rmempty = false

o = s:option(Value, "port", translate("Port"))
o.datatype = "and(port,min(1))"
o.default = "5051"
o.rmempty = false

o = s:option(Value, "username", translate("Username"))
o.datatype = "string"

o = s:option(Value, "password", translate("Password"))
o.description = translate("Leave blank to disable auth")
o.datatype = "string"
o.password = true

o = s:option(Value, "config_path", translate("Data Storage Path"))
o.default = "/etc/xunlei"

o = s:option(Value, "download_dir", translate("Default Download Path"))
o.default = "/mnt"

return m
