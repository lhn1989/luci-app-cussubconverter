module("luci.controller.cussubconverter", package.seeall)

function index()
        entry({"admin", "services", "cussubconverter"}, cbi("cussubconverter")
        entry({"admin", "services", "cussubconverter", "convert"}, call("convert"), _("CusSubConver"), 100)
        end

-- trim                                                                         
local function trim(text)                                                       
        if not text or text == "" then                                          
                return ""                                                       
        end                                                                     
        return (sgsub(text, "^%s*(.-)%s*$", "%1"))                              
end

-- wget
local function wget(url)
        local stdout = luci.sys.exec('wget -q --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36" --no-check-certificate -O- "' .. url .. '"')
        return trim(stdout)
end

function convert()

local ucic = luci.model.uci.cursor()
local conurl = ucic:get_first('cussubconverter', 'cussubconverter', 'conurl', 'https://raw.githubusercontent.com/lhn1989/Rules/master/Subscription/config.yaml') 
local subscribe_url = ucic:get_first('cussubconverter', 'cussubconverter', 'suburl', {}) 

local dash = "- "
local u = ""

local p = ""                                                                    
local ind = "  "                                                                
                                                                                
local raw = wget(conurl)                                                        
                                                                                
for i, v in ipairs(a) do                                                        
        u = u .. ind .. dash .. v .. "\n"                                       
        p = p .. ind ..v .. ":\n"                                               
        p = p .. ind .. ind ..'path: "/proxy_provider/' .. v .. '.yaml" \n'     
        p = p .. ind .. ind .. '<<:*p \n'                                       
        p = p .. ind .. ind .. 'url:"' .. '"\n'                                 
end                                                                             
print(u)                                                                        
print(p)                                                                        
raw = string.gsub(raw, "use-placeholder", u)                                    
raw = string.gsub(raw, "proxy-providers-placeholder", p)                        
print(raw)                                                                      
                                                                                
luci.http.prepare_content("application/json")                           
luci.http.write_json(raw)                                               
end
