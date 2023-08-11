local UserInputService = game:GetService("UserInputService")

local server = script.Parent
local dropHat = server:WaitForChild("DropHat")

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then
		return
	end

	if input.KeyCode == Enum.KeyCode.Equals or input.KeyCode == Enum.KeyCode.DPadDown then
		dropHat:FireServer()
	end
end)