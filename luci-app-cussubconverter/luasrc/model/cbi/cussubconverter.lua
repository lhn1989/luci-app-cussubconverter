require("luci.sys")

m = Map("cussubconverter", translate("Custom Subscription Converter"), translate

s = m:section(TypedSection, "cussubconverter", "")
s.addremove = false
s.anonymous = true

conurl = s:option(Value, "conurl", translate("Config URL"))
conurl.placeholder = 'https://raw.githubusercontent.com/lhn1989/Rules/master/Subscription/config.yaml'
suburl = s:option(DynamicList, "suburl", translate("Subscription URL"))

return m
