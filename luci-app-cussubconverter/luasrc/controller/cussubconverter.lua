module("luci.controller.cussubconverter", package.seeall)

function index()
        entry({"admin", "services", "cussubconverter"}, cbi("cussubconverter"), _("CusSubConverter"), 10)
        entry({"admin", "services", "cussubconverter", "convert"}, call("convert"))
end

function convert()
        message = luci.sys.exec("/usr/bin/lua /usr/share/cussubconverter/cussubconverter.lua")
	luci.http.prepare_content("text/plain")
	luci.http.write(message)                                           
end
