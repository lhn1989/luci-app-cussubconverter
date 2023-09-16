require "luci.model.uci"
require "luci.sys"

-- trim
local function trim(text)
        if not text or text == "" then
                return ""
        end
        return (string.gsub(text, "^%s*(.-)%s*$", "%1"))
end

-- wget
local function wget(url)
        local stdout = luci.sys.exec('wget -q --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36" --no-check-certificate -O- "' .. url .. '"')
        return trim(stdout)
end

local ucic = luci.model.uci.cursor()
local conurl = ucic:get_first('cussubconverter', 'cussubconverter', 'conurl', 'https://raw.githubusercontent.com/lhn1989/Rules/master/Subscription/config.yaml')
local suburl = ucic:get_first('cussubconverter', 'cussubconverter', 'suburl', {})

local dash = "- "
local u = "  use:"

local p = ""
local ind = "  "

local raw = wget(conurl)

for k, url in ipairs(suburl) do
        u = "\n" .. u .. ind .. ind .. dash .. k
        p = p .. ind .. k .. ":\n"
        p = p .. ind .. ind ..'path: "/proxy_provider/' .. k .. '.yaml"\n'
        p = p .. ind .. ind .. '<<: *p\n'
        p = p .. ind .. ind .. 'url: "' .. url .. '"\n'
end
raw = string.gsub(raw, "UsePlaceholder", u)
raw = string.gsub(raw, "ProxyProvidersPlaceholder", p)
print(raw)
