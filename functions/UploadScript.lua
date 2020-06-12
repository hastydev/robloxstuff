
--[[local alan = function(Content, Developer_Key)
local HttpEnabled = function()
    local toreturn = pcall(function() 
        game:GetService('HttpService'):GetAsync('http://www.google.com/')
    end)
    return toreturn
end
if not HttpEnabled() then
return "HTTP Requests are not Enabled!"
end
local HttpService = game:GetService("HttpService")
local worked,link = pcall(function()
local tocheck = HttpService:PostAsync('http://pastebin.com/api/api_post.php','api_dev_key='..Developer_Key..'&api_option=paste&api_paste_code=' .. HttpService:UrlEncode(Content).."&api_paste_private=1",2)
if not string.find(tocheck,"pastebin") then
error("Something errored!")
end
end)
if not worked then
return "Failed to upload."
end
local toreturn = "https://pastebin.com/raw/" .. string.sub(link, 22)
return toreturn
end--]]
local alan = function(Code,Key)
local HttpEnabled = function()
    local toreturn = pcall(function() 
        game:GetService('HttpService'):GetAsync('http://www.google.com/')
    end)
    return toreturn
end
if not HttpEnabled() then
return "HTTP Requests are not Enabled!"
end
local data = {
key = Key,
description = "alan",
paste = Code,
format = "JSON"
}
local worked,tbl = pcall(function()
local tocheck = HttpService:PostAsync('http://paste.ee/api',HttpService:JSONEncode(data))
if not string.find(tocheck,"raw") then
error("Something errored!")
else
return tocheck
end
end)
local link = HttpService:JSONDecode(tbl).paste.raw
return link
end
return alan
