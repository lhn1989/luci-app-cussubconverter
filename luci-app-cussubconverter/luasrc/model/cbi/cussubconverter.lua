require("luci.sys")

font_red = [[<b style=color:green>]]
font_off = [[</b>]]

m = Map("cussubconverter", translate("Custom Subscription Converter"))
m.description = translate("A Custom Subsription Converter For Ryan and his friends.")..
"<br/>"..
"<br/>"..translate("Convertered URL: ")..
"<br/>"..font_red.."http://192.168.100.1/cgi-bin/cussubconverter"..font_off

s = m:section(TypedSection, "cussubconverter", "")
s.addremove = false
s.anonymous = true

conurl = s:option(Value, "conurl", translate("Config URL"))
suburl = s:option(DynamicList, "suburl", translate("Subscription URL"))

return m
