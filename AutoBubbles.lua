-- BLOWING BUBBLES
local plr = game:GetService("Players").LocalPlayer
local plrName = game:GetService("Players").LocalPlayer.Name

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Auto Bubbling | Free Script",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Bubble Farming",
    IntroEnabled = true,
    IntroText = "Opening Interface",
    CloseCallback = function()
        print("Interface Closed")
    end
})

OrionLib:MakeNotification({
    Name = "Welcome Back",
    Content = "Thank You For Executing This Interface "..game.Players.LocalPlayer.Name.."!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

local Tab = Window:MakeTab({
    Name = "Bubble Farming",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Farming Functions ETC"
})

Tab:AddToggle({
    Name = "Auto Bubble",
    Default = false,
    Callback = function(BlowBubbles)
        if BlowBubbles == true then
            _G.AutoBubbles = true
            while _G.AutoBubbles == true do
                wait(0.1)
                local args = {
                    [1] = "BlowBubble",
                    [2] = true
                }
                game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(unpack(args))
                if BlowBubbles == false then
                    _G.AutoBubbles = false
                    break
                end
            end
        else
            _G.AutoBubbles = false
        end
    end
})
