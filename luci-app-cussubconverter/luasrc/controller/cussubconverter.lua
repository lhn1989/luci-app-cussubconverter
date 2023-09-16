module("luci.controller.cussubconverter", package.seeall)

function index()
        entry({"admin", "services", "cussubconverter"}, cbi("cussubconverter"), _("CusSubConverter"), 100)
        entry({"admin", "services", "cussubconverter", "convert"}, call("convert"))
end

function convert()
        message = luci.sys.exec("/usr/bin/lua /usr/share/cussubconverter/cussubconverter.lua")
	luci.http.prepare_content("text/plain; charset=UTF-8")
	luci.http.write(message)                                           
end
