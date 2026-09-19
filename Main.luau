local players = game:GetService("Players")
local player = players.LocalPlayer

local screenGui = Instance.new("ScreenGui", player.PlayerGui)
local Command = Instance.new("Frame", screenGui)
local sf = Instance.new("ScrollingFrame", Command)
local tb = Instance.new("TextBox", sf)
local btn = Instance.new("TextButton", Command)
local UCC6 = Instance.new("UICorner", btn)
local UCC = Instance.new("UIStroke", btn)
local UCC_Cmd = Instance.new("UICorner", Command)
local UCC2 = Instance.new("UICorner", sf)
local UCC3 = Instance.new("UICorner", tb)
local UCC4 = Instance.new("UIStroke", Command)
local UCC5 = Instance.new("UIStroke", tb)

Command.Size = UDim2.new(0.5, 0, 0.7, 0)
Command.Position = UDim2.new(0.2, 0, 0.1, 0)
Command.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Command.Draggable = true

sf.Position = UDim2.new(0.05, 0, 0.05, 0)
sf.Size = UDim2.new(0.9, 0, 0.6, 0)
sf.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

-- 1. TEXTBOX (This is where the user types)
tb.Size = UDim2.new(1, 0, 1, 0)
tb.Font = Enum.Font.Code
tb.TextXAlignment = Enum.TextXAlignment.Left
tb.TextYAlignment = Enum.TextYAlignment.Top
tb.MultiLine = true
tb.ClearTextOnFocus = false
tb.BackgroundTransparency = 1
tb.TextColor3 = Color3.fromRGB(255, 255, 255)
tb.TextTransparency = 1 -- Hidden by default
tb.Text = "print(Hello world)"
tb.TextSize = 16
tb.ZIndex = 1

-- 2. VISIBLE COLOR LABEL (This displays the theme colors)
local hl = Instance.new("TextLabel", sf)
hl.Size = UDim2.new(1, 0, 1, 0)
hl.Font = Enum.Font.Code
hl.TextXAlignment = Enum.TextXAlignment.Left
hl.TextYAlignment = Enum.TextYAlignment.Top
hl.BackgroundTransparency = 1
hl.TextColor3 = Color3.fromRGB(255, 255, 255)
hl.RichText = true -- ALLOWS COLOR TAGS LIKE <font color="...">
hl.TextSize = 16
hl.ZIndex = 2
hl.Text = "print(Hello world)"

-- 3. THE SIMPLIFIED COLOR FUNCTION
local function ApplyColors(txt)
    -- Put your theme hex colors here
    local keywordColor = "#F92672" -- Pink
    local globalColor = "#66D9EF" -- Blue
  local VarColor = "#ebd534"    -- Yellow
    
    -- Replace words with colored versions
    txt = txt:gsub("local", '<font color="'..keywordColor..'">local</font>')
    txt = txt:gsub("function", '<font color="'..keywordColor..'">function</font>')
    txt = txt:gsub("end", '<font color="'..keywordColor..'">end</font>')
    txt = txt:gsub("print", '<font color="'..globalColor..'">print</font>')
    txt = txt:gsub("Workspace", '<font color="'..globalColor..'">game</font>')
    txt = txt:gsub("true", '<font color="'..VarColor..'">true</font>')
  txt = txt:gsub("false", '<font color="'..VarColor..'">false</font>')
  txt = txt:gsub("return", '<font color="'..keywordColor..'">return</font>')
txt = txt:gsub("return", '<font color="'..keywordColor..'"></font>')
txt = txt:gsub("return", '<font color="'..keywordColor..'">return</font>')
    return txt
end 

-- Run initial coloring for the default starting text
hl.Text = ApplyColors(tb.Text)

-- ========================================================
-- FOCUS LOGIC: TOGGLE NORMAL TEXT VS COLORED TEXT
-- ========================================================

-- When you click inside to type: Show normal text, hide colors, bring textbox forward
tb.Focused:Connect(function()
    tb.ZIndex = 2
    hl.ZIndex = 1
    tb.TextTransparency = 0  -- Make normal white text visible
    hl.Visible = false       -- Hide the colored version
end)

-- When you click away or stop typing: Hide normal text, update and show colors
tb.FocusLost:Connect(function()
    tb.ZIndex = 1
    hl.ZIndex = 2
    tb.TextTransparency = 1  -- Hide raw text
    hl.Text = ApplyColors(tb.Text) -- Process colors
    hl.Visible = true        -- Show colored text label
end)

-- ========================================================

-- 4. UPDATE COLORS ON TYPE
tb:GetPropertyChangedSignal("Text"):Connect(function()
    local ScaleX = (tonumber(string.len(tb.Text)) / 5)
    local ScaleY = (tonumber(string.len(tb.Text)) / 10)
    
    -- Keep scale from dropping below 1 so it fits the viewport box properly
    if ScaleX < 1 then ScaleX = 1 end
    if ScaleY < 1 then ScaleY = 1 end
    
    local newSize = UDim2.new(ScaleX, 0, ScaleY, 0)
    sf.CanvasSize = newSize
    tb.Size = newSize
    hl.Size = newSize
    
    -- Continuously tracks sizing layout tweaks but lets Focus Lost/Gain manage structural transparency
    if not tb:IsFocused() then
        hl.Text = ApplyColors(tb.Text)
    end
end)

-- 5. EXECUTE BUTTON
btn.Text = "Execute"
btn.Size = UDim2.new(0.9, 0, 0.2, 0)
btn.Position = UDim2.new(0.05, 0, 0.7, 0)
btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.Code
btn.TextSize = 20

btn.MouseButton1Click:Connect(function()
    loadstring(tb.Text)()
end)
