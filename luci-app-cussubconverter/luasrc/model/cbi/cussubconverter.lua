require("luci.sys")

font_red = [[<b style=color:red>]]
font_off = [[</b>]]

m = Map("cussubconverter", translate("Custom Subscription Converter"))
m.description = translate("A Custom Subsription Converter For Ryan and his friends.")..
"<br/>"..
"<br/>"..translate("Convertered URL: ")..
"<br/>".."http://192.168.100.1/cgi-bin/luci/admin/services/cussubconverter/convert?luci_username=root&luci_password="..font_red.."XXX"..font_off

s = m:section(TypedSection, "cussubconverter", "")
s.addremove = false
s.anonymous = true

conurl = s:option(Value, "conurl", translate("Config URL"))
conurl.placeholder = 'https://raw.githubusercontent.com/lhn1989/Rules/master/Subscription/config.yaml'
suburl = s:option(DynamicList, "suburl", translate("Subscription URL"))

return m
