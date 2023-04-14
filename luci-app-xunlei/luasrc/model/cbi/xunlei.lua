local m, s

m = Map("xunlei", translate("Xunlei"))
m.description = translate("NAS Xunlei DSM 7.x Beta Version")

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

o = s:option(Value, "config_path", translate("Data Storage Path"))
o.default = "/etc/xunlei"

o = s:option(Value, "download_dir", translate("Default Download Path"))
o.default = "/mnt"

return m
