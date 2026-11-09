-- 1. Get the player's UI container
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 2. Create the ScreenGui (The main container on the screen)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TestButtonGui"
ScreenGui.ResetOnSpawn = false -- Keeps the button on screen when you die

-- Safely handle parenting (CoreGui works in executors, PlayerGui works everywhere)
local success, err = pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)
if not success then
    ScreenGui.Parent = PlayerGui
end

-- 3. Create the TextButton
local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(0, 200, 0, 50) -- Width: 200 pixels, Height: 50 pixels
TextButton.Position = UDim2.new(0.5, -100, 0.4, 0) -- Centered on the screen
TextButton.BackgroundColor3 = Color3.fromRGB(45, 125, 245) -- Bright blue color
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
TextButton.Font = Enum.Font.SourceSansBold
TextButton.TextSize = 20
TextButton.Text = "Click Me!"
TextButton.Parent = ScreenGui

-- 4. Add rounded corners to make it look clean
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8) -- 8-pixel round corners
UICorner.Parent = TextButton

-- 5. Define what happens when the button is clicked
TextButton.MouseButton1Click:Connect(function()
    -- Action 1: Print to the developer console (F9)
    print("The button was clicked successfully!")
    
    -- Action 2: Flash the button green temporarily as feedback
    TextButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113) -- Green
    TextButton.Text = "Clicked!"
    
    task.wait(0.5) -- Wait half a second
    
    -- Action 3: Reset back to the original blue style
    TextButton.BackgroundColor3 = Color3.fromRGB(45, 125, 245) -- Blue
    TextButton.Text = "Click Me!"
end)
