module("luci.controller.cussubconverter", package.seeall)

function index()
        entry({"admin", "services", "cussubconverter"}, cbi("cussubconverter")
        entry({"admin", "services", "cussubconverter", "convert"}, call("convert"), _("CusSubConver"), 100)
        end

function convert()
        message = luci.sys.exec("/usr/bin/lua /usr/share/shadowsocksr/subscribe.lua >>/var/log/ssrplus.log")
	luci.http.prepare_content("text/plain")
	luci.http.write(message)                                           
end
