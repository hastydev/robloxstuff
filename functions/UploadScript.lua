
local alan = function(Content, Developer_Key)
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
print(link)
return "Failed to upload."
end
local toreturn = "https://pastebin.com/raw/" .. string.sub(link, 22)
return toreturn
end

return alan
