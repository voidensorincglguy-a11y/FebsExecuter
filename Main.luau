local players = game:GetService("Players") 
local player = players.LocalPlayer 
local screenGui = Instance.new("ScreenGui", player.PlayerGui) 
local Command = Instance.new("Frame", screenGui) 
local btn3 = Instance.new("TextButton", screenGui) 
local sf = Instance.new("ScrollingFrame", Command) 
local tb = Instance.new("TextBox", sf) 
local btn = Instance.new("TextButton", Command) 
local btn2 = Instance.new("TextButton", Command) 
local SFile = Instance.new("Frame", screenGui)
local LineSeperation = Instance.new("Frame", SFile)

local UCC6 = Instance.new("UICorner", btn) 
local UCC = Instance.new("UIStroke", btn) 
local UCC_Cmd = Instance.new("UICorner", Command) 
local UCC2 = Instance.new("UICorner", sf) 
local UCC3 = Instance.new("UICorner", tb) 
local UCC4 = Instance.new("UIStroke", Command) 
local UCC5 = Instance.new("UIStroke", tb) 
local UCC6_2 = Instance.new("UICorner", btn2) 
local UCC7 = Instance.new("UICorner", btn3) 
local UCC8 = Instance.new("UICorner", SFile)
local UCC9 = Instance.new("UIStroke", SFile)
local UCC10 = Instance.new("UIGradient", Command)
local UCC11 = Instance.new("UIStroke", sf)
local UCC12 = Instance.new("UIStroke", btn3)
local UCC13 = Instance.new("UICorner", LineSeperation)

screenGui.ResetOnSpawn = false
UCC7.CornerRadius = UDim.new(0, 64)
UCC.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UCC4.Thickness = 3
UCC4.Color = Color3.fromRGB(255,255,255)
UCC12.Color = Color3.fromRGB(255,255,255)
UCC12.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UCC9.Thickness = 3

UCC11.Thickness = 1
UCC11.Color = Color3.fromRGB(255,255,255)
UCC9.Color = Color3.fromRGB(255,255,255)
UCC.Color = Color3.fromRGB(255,255,255)

UCC9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UCC_Cmd.CornerRadius = UDim.new(0, 4)
UCC10.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 120, 120)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
})

LineSeperation.Position = UDim2.new(0.125, 0, -0.012, 0)
LineSeperation.Size = UDim2.new(0.01, 0, 1.025, 0)
LineSeperation.BackgroundColor3 = Color3.fromRGB(255,255,255)

Command.Size = UDim2.new(0.798, 0, 0.684, 0)
Command.Position = UDim2.new(0.152, 0, 0.157, 0)
Command.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 

SFile.Position = UDim2.new(0.028, 0, 0.033, 0)
SFile.Size = UDim2.new(0.926, 0, 0.813, 0)
SFile.BackgroundColor3 = Color3.fromRGB(5,5,5)
SFile.ZIndex = 0.5

btn2.Position = UDim2.new(0.327, 0, 0.928, 0) 
btn2.Size = UDim2.new(0.341, 0, 0.046, 0) 
btn2.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
btn2.Font = Enum.Font.Code 
btn2.Text = "×" 
btn2.TextColor3 = Color3.fromRGB(255, 255, 255) 

btn3.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
btn3.Text = "O" 
btn3.Font = Enum.Font.Code 
btn3.Draggable = true 
btn3.TextSize = 16 
btn3.TextColor3 = Color3.fromRGB(255, 255, 255) 
btn3.Position = UDim2.new(0.5, 0, 0.5, 0) 
btn3.Size = UDim2.new(0.05, 0, 0.1, 0) 
btn3.Visible = false 

sf.Position = UDim2.new(0.05, 0, 0.05, 0) 
sf.Size = UDim2.new(0.9, 0, 0.6, 0) 
sf.BackgroundColor3 = Color3.fromRGB(15, 15, 15) 
sf.CanvasSize = UDim2.new(3, 0, 10, 0) 

-- 1. TEXTBOX (Where you type) 
tb.Size = UDim2.new(1, 0, 1, 0) 
tb.Font = Enum.Font.Code 
tb.TextXAlignment = Enum.TextXAlignment.Left 
tb.TextYAlignment = Enum.TextYAlignment.Top 
tb.MultiLine = true 
tb.ClearTextOnFocus = false 
tb.BackgroundTransparency = 1 
tb.TextColor3 = Color3.fromRGB(255, 255, 255) 
tb.TextTransparency = 1 
tb.Text = "print('Hello world')" 
tb.TextSize = 16 
tb.ZIndex = 3

-- 2. VISIBLE COLOR LABEL (The highlights) 
local hl = Instance.new("TextLabel", sf) 
hl.Size = UDim2.new(1, 0, 1, 0) 
hl.Font = Enum.Font.Code 
hl.TextXAlignment = Enum.TextXAlignment.Left 
hl.TextYAlignment = Enum.TextYAlignment.Top 
hl.BackgroundTransparency = 1 
hl.TextColor3 = Color3.fromRGB(255, 255, 255) 
hl.RichText = true 
hl.TextSize = 16 
hl.ZIndex = 2
hl.Text = "print('Hello world')" 



local function ApplyColors(input: string): string
	-- Palette definition
	local pink   = "#F92672" 
	local blue   = "#66D9EF" 
	local yellow = "#ebd534" 
	local cyan   = "#34baeb" 
	local orange = "#fc5e03" 
	local wpink  = "#d442f5" 
	local green  = "#149e11" 

	-- Color lookup table
	local colorMap: { [string]: string } = {
		["local"]    = pink,
		["function"] = pink,
		["end"]      = pink,
		["return"]   = pink,
		["if"]       = pink,
		["elseif"]   = pink,
		["else"]     = pink,
		["then"]     = pink,
		["while"]    = pink,
		["do"]       = pink,
		["for"]      = pink,
		["and"]      = pink,
		["not"]      = pink,
		["or"]       = pink,
		["=="]       = pink,
		["("]        = yellow,
		[")"]        = yellow,

		["print"]          = blue,
		["game"]           = blue,
		["Connect"]        = blue,
		["InvokeServer"]   = blue,
		["wait"]           = blue,
		["hookmetamethod"] = blue,
		["getnamecall"]    = blue,
		["checkcall"]      = blue,
		["unpack"]         = blue,

		["true"]  = yellow,
		["false"] = yellow,
		["nil"]   = yellow,

		["Vector3"]     = cyan,
		["new"]         = cyan,
		["getgenv"]     = cyan,
		["workspace"]   = cyan,
		["Workspace"]   = cyan,
		["GetService"]  = cyan,
		["task"]        = cyan,

		["FireServer"] = orange,
		["getrenv"]    = wpink,
		["Enum"]       = green,
	}

	-- 1. Escape XML characters first
	local txt = input:gsub("&", "&amp;")
	txt = txt:gsub("<", "&lt;")
	txt = txt:gsub(">", "&gt;")

	-- 2. Store strings in a table and replace them with UNIQUE tokens
	local stringStorage: { string } = {}

	-- Match double quotes "..."
	txt = txt:gsub('".-"', function(matchedStr)
		table.insert(stringStorage, string.format('<font color="%s">%s</font>', green, matchedStr))
		return "___STRTOKEN_" .. #stringStorage .. "___"
	end)

	-- Match single quotes '...'
	txt = txt:gsub("'-.'", function(matchedStr)
		table.insert(stringStorage, string.format('<font color="%s">%s</font>', green, matchedStr))
		return "___STRTOKEN_" .. #stringStorage .. "___"
	end)

	-- 3. Highlight Symbols
	txt = txt:gsub("==", string.format('<font color="%s">==</font>', colorMap["=="]))
	txt = txt:gsub("%(", string.format('<font color="%s">(</font>', colorMap["("]))
	txt = txt:gsub("%)", string.format('<font color="%s">)</font>', colorMap[")"]))

	-- 4. Highlight Numbers (Supports negative, decimal, and scientific notation)
	txt = txt:gsub("%f[%w_%-]%-?%d+%.?%d*[eE]?%-?%d*%f[%W]", function(num)
		return string.format('<font color="%s">%s</font>', blue, num)
	end)

	-- 5. Highlight Keywords
	txt = txt:gsub("%f[%w_]%a+%f[%W]", function(word)
		local color = colorMap[word]
		if color then
			return string.format('<font color="%s">%s</font>', color, word)
		end
		return word
	end)

	-- 6. Restore each unique string by matching its specific ID index
	txt = txt:gsub("___STRTOKEN_(%d+)___", function(idStr)
		local index = tonumber(idStr)
		if index and stringStorage[index] then
			return stringStorage[index]
		end
		return idStr
	end)

	return txt
end


--------------------------------------------------------------------------------
-- GUI Implementation Example
-------------------------------------------



task.wait(.1)
hl.Text = ApplyColors(tb.Text) 

-- FOCUS LOGIC 
tb.Focused:Connect(function() 
    tb.TextTransparency = 0 
    hl.Visible = false 
    tb.ZIndex = 3
    hl.ZIndex = 2
end) 

tb.FocusLost:Connect(function() 
    tb.TextTransparency = 1 
    hl.Text = ApplyColors(tb.Text) 
    hl.Visible = true
    tb.ZIndex = 2
    hl.ZIndex = 3
end) 

-- UPDATE LOGIC 
tb:GetPropertyChangedSignal("Text"):Connect(function() 
    if not tb:IsFocused() then 
        hl.Text = ApplyColors(tb.Text) 
    end 
end) 

-- EXECUTE BUTTON 
btn.Text = "Execute" 
btn.Size = UDim2.new(0.9, 0, 0.2, 0) 
btn.Position = UDim2.new(0.05, 0, 0.7, 0) 
btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
btn.TextColor3 = Color3.fromRGB(255, 255, 255) 
btn.Font = Enum.Font.Code 
btn.TextSize = 20 

btn2.MouseButton1Click:Connect(function() 
    Command.Visible = false 
    btn3.Visible = true 
    SFile.Visible = false
end) 

btn3.MouseButton1Click:Connect(function() 
    Command.Visible = true 
    btn3.Visible = false
    SFile.Visible = true
end) 

local VectorFunc = {}
VectorFunc.__index = VectorFunc

function VectorFunc.TeleportRootPart(Player, TPPart, x, y, z)
for _, v in pairs(Player:GetChildren()) do
if v.Name == "HumanoidRootPart" then
v.CFrame = TPPart.CFrame + Vector3.new(x, y, z)
end
end
end

btn.MouseButton1Click:Connect(function() 
    loadstring(tb.Text)() 
end)