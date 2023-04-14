local sys  = require "luci.sys"
local http = require "luci.http"

module("luci.controller.xunlei", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/xunlei") then
		return
	end

	local page = entry({"admin", "nas", "xunlei"}, cbi("xunlei"), _("Xunlei"), 100)
	page.dependent = true
	page.acl_depends = { "luci-app-xunlei" }

	entry({"admin", "nas", "xunlei", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e = {}
	e.running = sys.call("pgrep -f xunlei >/dev/null") == 0
	http.prepare_content("application/json")
	http.write_json(e)
end
