
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
local tocheck = HttpService:PostAsync('http://pastebin.com/api/api_post.php','api_dev_key='.. Developer_Key ..'&api_option=paste&api_paste_code=' .. HttpService:UrlEncode(Content).."&api_paste_private=1",2)
return tocheck
end)
if not worked then
return "Failed to upload."
end
local toreturn
if string.find(link,"pastebin.com") then
toreturn = "https://pastebin.com/raw/" .. string.sub(link, 22)
else
toreturn = "Failed to upload: "..link
end
return toreturn
end

return alan
