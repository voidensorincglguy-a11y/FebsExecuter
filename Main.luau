local players = game:GetService("Players") 
local player = players.LocalPlayer 
local screenGui = Instance.new("ScreenGui", player.PlayerGui) 
local Command = Instance.new("Frame", screenGui) 
local btn3 = Instance.new("TextButton", screenGui) 
local sf = Instance.new("ScrollingFrame", Command) 
local tb = Instance.new("TextBox", sf) 
local btn = Instance.new("TextButton", Command) 
local btn2 = Instance.new("TextButton", Command) 

local UCC6 = Instance.new("UICorner", btn) 
local UCC = Instance.new("UIStroke", btn) 
local UCC_Cmd = Instance.new("UICorner", Command) 
local UCC2 = Instance.new("UICorner", sf) 
local UCC3 = Instance.new("UICorner", tb) 
local UCC4 = Instance.new("UIStroke", Command) 
local UCC5 = Instance.new("UIStroke", tb) 
local UCC6_2 = Instance.new("UICorner", btn2) -- FIXED: Changed from duplicate UCC6 to UCC6_2
local UCC7 = Instance.new("UICorner", btn3) 

UCC_Cmd.CornerRadius = UDim.new(0, 2) 
Command.Size = UDim2.new(0.7, 0, -0.2, 0) 
Command.Position = UDim2.new(0.2, 0, 0.8, 0) 
Command.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 

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
tb.ZIndex = 2 

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
hl.ZIndex = 3 
hl.Text = "print('Hello world')" 

-- 3. THE CLEAN COLOR FUNCTION 
local function ApplyColors(txt) 
    local pink = "#F92672" 
    local blue = "#66D9EF" 
    local yellow = "#ebd534" 
    local cyan = "#34baeb" 
    local orange = "#fc5e03" 
    local wpink = "#d442f5" 
    local green = "#149e11" 

    txt = txt:gsub("local", '<font color="'..pink..'">local</font>') 
    txt = txt:gsub("function", '<font color="'..pink..'">function</font>') 
    txt = txt:gsub("end", '<font color="'..pink..'">end</font>') 
    txt = txt:gsub("print", '<font color="'..blue..'">print</font>') 
    txt = txt:gsub("game", '<font color="'..blue..'">game</font>') 
    txt = txt:gsub("true", '<font color="'..yellow..'">true</font>') 
    txt = txt:gsub("false", '<font color="'..yellow..'">false</font>') 
    txt = txt:gsub("return", '<font color="'..pink..'">return</font>') 
    txt = txt:gsub("new", '<font color="'..cyan..'">new</font>') 
    txt = txt:gsub("Connect", '<font color="'..blue..'">Connect</font>') 
    txt = txt:gsub("getgenv", '<font color="'..cyan..'">getgenv</font>') 
    txt = txt:gsub("if", '<font color="'..pink..'">if</font>') 
    txt = txt:gsub("elseif", '<font color="'..pink..'">elseif</font>') -- FIXED: Prevent else logic from breaking elseif
    txt = txt:gsub("else", '<font color="'..pink..'">else</font>') -- FIXED: Stopped else from changing into elseif
    txt = txt:gsub("FireServer", '<font color="'..orange..'">FireServer</font>') 
    txt = txt:gsub("InvokeServer", '<font color="'..blue..'">InvokeServer</font>') 
    txt = txt:gsub("Workspace", '<font color="'..cyan..'">Workspace</font>') 
    txt = txt:gsub("getrenv", '<font color="'..wpink..'">getrenv</font>') 
    txt = txt:gsub("GetService", '<font color="'..cyan..'">GetService</font>') 
    txt = txt:gsub("then", '<font color="'..pink..'">then</font>') 
    txt = txt:gsub("Enum", '<font color="'..green..'">Enum</font>') 
    txt = txt:gsub("==", '<font color="'..pink..'">==</font>') 
    txt = txt:gsub("task", '<font color="'..cyan..'">task</font>') 
    txt = txt:gsub("wait", '<font color="'..blue..'">wait</font>') 
    txt = txt:gsub("while", '<font color="'..pink..'">while</font>') 
    txt = txt:gsub("do", '<font color="'..pink..'">do</font>') 

    return txt 
end 

hl.Text = ApplyColors(tb.Text) 

-- ======================================================== 
-- FOCUS LOGIC 
-- ======================================================== 
tb.Focused:Connect(function() 
    tb.TextTransparency = 0 
    hl.Visible = false 
end) 

tb.FocusLost:Connect(function() 
    tb.TextTransparency = 1 
    hl.Text = ApplyColors(tb.Text) 
    hl.Visible = true 
end) 

-- ======================================================== 
-- 4. SIMPLIFIED UPDATE LOGIC 
-- ======================================================== 
tb:GetPropertyChangedSignal("Text"):Connect(function() 
    if not tb:IsFocused() then 
        hl.Text = ApplyColors(tb.Text) 
    end 
end) 

-- ======================================================== 
-- 5. EXECUTE BUTTON 
-- ======================================================== 
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
end) 

btn3.MouseButton1Click:Connect(function() 
    Command.Visible = true 
    btn3.Visible = false 
end) 

btn.MouseButton1Click:Connect(function() 
    loadstring(tb.Text)() 
end)
