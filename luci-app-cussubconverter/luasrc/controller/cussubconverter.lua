module("luci.controller.cussubconverter", package.seeall)

function index()
        entry({"admin", "services", "cussubconverter"}, cbi("cussubconverter"), _("CusSubConverter"), 49)
end
