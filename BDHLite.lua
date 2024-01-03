-- BetterDaHood Lite Version
-- -------------------------
--
--Developed for ZainSmart by BetterDaHood

--Settings
--[[
if not LPH_OBFUSCATED then
    getgenv().mainId = 123 -- Put your main accounts user id here

    getgenv().alts = { -- Replace the 123s with your alt IDs (copy and paste line for more alts, max is 39) (make sure they are in numbered order)
        123,
    }
end
--]]

--Anti-cheat disable
if getgenv().antiCheatEnabled ~= true then
    getgenv().antiCheatEnabled = true
    LPH_JIT_MAX(function()
        local events = {"OneMoreTime", "TeleportDetect", "CHECKER_1", "CHECKER_2", "OneMoreTime", "BreathingHAMON", "VirusCough"}
        local hook = nil
        hook = hookmetamethod(game, "__namecall", function(...)
            local Args = {...}
            local self = Args[1]
            local namecall = getnamecallmethod()
            local calledFromExecutor = checkcaller()
            --local callingScript = getcallingscript()

            if namecall == "FireServer" and self == MAIN_EVENT then
                if table.find(events, Args[2]) then -- anti-anti-cheat
                    return nil
                elseif calledFromExecutor == false then
                    if Args[2] == "UpdateMousePos" then
                        --print("UpdateMousePos Blocked")
                        return nil
                    elseif Args[2] == "AnimationPack" then
                        if Args[3] == "Lay [X]" then
                            return hook(self, "AnimationPack", "Lay")
                        elseif Args[3] == "Greet [C]" then
                            return hook(self, "AnimationPack", "Greet")
                        end
                    end
                end
            --[[
            elseif namecall == "Activate" then
                for i,v in pairs(Args) do
                    print(tostring(i).." = "..tostring(v))
                end
                --]]
            end
            return hook(...)
        end)
    end)();
end

--Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--Consts
local PLAYER = Players.LocalPlayer
local DATA_FOLDER = PLAYER:WaitForChild("DataFolder")
local PLAYER_CASH = DATA_FOLDER:WaitForChild("Currency")
local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent")
local CHAT_EVENT = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local REQUIRED_CHAR_PARTS = {
    ["Humanoid"] = true,
    ["HumanoidRootPart"] = true,
    ["UpperTorso"] = true,
    ["LowerTorso"] = true,
    ["Head"] = true,
}
local ALT_SETUP_LOCATIONS_V2 = {
    ["admin"] = {
        [1] = Vector3.new(-828.01, -39.9, -556),
        [2] = Vector3.new(-828.01, -39.9, -568),
        [3] = Vector3.new(-828.01, -39.9, -580),
        [4] = Vector3.new(-828.01, -39.9, -592),
        [5] = Vector3.new(-828.01, -39.9, -604),
        [6] = Vector3.new(-828.01, -39.9, -616),
        [7] = Vector3.new(-845.01, -39.9, -556),
        [8] = Vector3.new(-845.01, -39.9, -568),
        [9] = Vector3.new(-845.01, -39.9, -580),
        [10] = Vector3.new(-845.01, -39.9, -592),
        [11] = Vector3.new(-845.01, -39.9, -604),
        [12] = Vector3.new(-845.01, -39.9, -616),
        [13] = Vector3.new(-862.01, -39.9, -556),
        [14] = Vector3.new(-862.01, -39.9, -568),
        [15] = Vector3.new(-862.01, -39.9, -580),
        [16] = Vector3.new(-862.01, -39.9, -592),
        [17] = Vector3.new(-862.01, -39.9, -604),
        [18] = Vector3.new(-862.01, -39.9, -616),
        [19] = Vector3.new(-880.01, -39.9, -556),
        [20] = Vector3.new(-880.01, -39.9, -568),
        [21] = Vector3.new(-880.01, -39.9, -580),
        [22] = Vector3.new(-880.01, -39.9, -592),
        [23] = Vector3.new(-880.01, -39.9, -604),
        [24] = Vector3.new(-880.01, -39.9, -616),
        [25] = Vector3.new(-897.01, -39.9, -556),
        [26] = Vector3.new(-897.01, -39.9, -568),
        [27] = Vector3.new(-897.01, -39.9, -580),
        [28] = Vector3.new(-897.01, -39.9, -592),
        [29] = Vector3.new(-897.01, -39.9, -604),
        [30] = Vector3.new(-897.01, -39.9, -616),
        [31] = Vector3.new(-914.01, -39.9, -556),
        [32] = Vector3.new(-914.01, -39.9, -568),
        [33] = Vector3.new(-914.01, -39.9, -580),
        [34] = Vector3.new(-914.01, -39.9, -592),
        [35] = Vector3.new(-914.01, -39.9, -604),
        [36] = Vector3.new(-914.01, -39.9, -616),
        [37] = Vector3.new(-871.01, -38.9, -610),
        [38] = Vector3.new(-871.01, -38.9, -586),
        [39] = Vector3.new(-871.01, -38.9, -562),
    },
    ["bank"] = {
		[1] = Vector3.new(-393.01, 21.75, -338),
		[2] = Vector3.new(-381.01, 21.75, -338),
		[3] = Vector3.new(-369.01, 21.75, -338),
		[4] = Vector3.new(-357.01, 21.75, -338),
		[5] = Vector3.new(-393.01, 21.75, -325),
		[6] = Vector3.new(-381.01, 21.75, -325),
		[7] = Vector3.new(-369.01, 21.75, -325),
		[8] = Vector3.new(-357.01, 21.75, -325),
		[9] = Vector3.new(-393.01, 21.75, -312),
		[10] = Vector3.new(-381.01, 21.75, -312),
		[11] = Vector3.new(-369.01, 21.75, -312),
		[12] = Vector3.new(-357.01, 21.75, -312),
		[13] = Vector3.new(-393.01, 21.75, -299),
		[14] = Vector3.new(-381.01, 21.75, -299),
		[15] = Vector3.new(-369.01, 21.75, -299),
		[16] = Vector3.new(-357.01, 21.75, -299),
		[17] = Vector3.new(-393.01, 21.75, -286),
		[18] = Vector3.new(-381.01, 21.75, -286),
		[19] = Vector3.new(-369.01, 21.75, -286),
		[20] = Vector3.new(-357.01, 21.75, -286),
		[21] = Vector3.new(-393.01, 21.75, -273),
		[22] = Vector3.new(-381.01, 21.75, -273),
		[23] = Vector3.new(-369.01, 21.75, -273),
		[24] = Vector3.new(-357.01, 21.75, -273),
		[25] = Vector3.new(-393.01, 21.75, -260),
		[26] = Vector3.new(-381.01, 21.75, -260),
		[27] = Vector3.new(-369.01, 21.75, -260),
		[28] = Vector3.new(-357.01, 21.75, -260),
		[29] = Vector3.new(-393.01, 21.75, -247),
		[30] = Vector3.new(-381.01, 21.75, -247),
		[31] = Vector3.new(-369.01, 21.75, -247),
		[32] = Vector3.new(-357.01, 21.75, -247),
		[33] = Vector3.new(-393.01, 21.75, -233),
		[34] = Vector3.new(-381.01, 21.75, -233),
		[35] = Vector3.new(-369.01, 21.75, -233),
		[36] = Vector3.new(-357.01, 21.75, -233),
		[37] = Vector3.new(-405.01, 21.75, -299),
		[38] = Vector3.new(-405.01, 21.75, -286),
		[39] = Vector3.new(-405.01, 21.75, -273),
	},
    ["club"] = {
        [1] = Vector3.new(-236.01, -6.9, -411),
        [2] = Vector3.new(-248.01, -6.9, -411),
        [3] = Vector3.new(-260.01, -6.9, -411),
        [4] = Vector3.new(-272.01, -6.9, -411),
        [5] = Vector3.new(-284.01, -6.9, -411),
        [6] = Vector3.new(-296.01, -6.9, -411),
        [7] = Vector3.new(-236.01, -6.9, -398),
        [8] = Vector3.new(-248.01, -6.9, -398),
        [9] = Vector3.new(-260.01, -6.9, -398),
        [10] = Vector3.new(-272.01, -6.9, -398),
        [11] = Vector3.new(-284.01, -6.9, -398),
        [12] = Vector3.new(-296.01, -6.9, -398),
        [13] = Vector3.new(-236.01, -6.9, -385),
        [14] = Vector3.new(-248.01, -6.9, -385),
        [15] = Vector3.new(-260.01, -6.9, -385),
        [16] = Vector3.new(-272.01, -6.9, -385),
        [17] = Vector3.new(-284.01, -6.9, -385),
        [18] = Vector3.new(-296.01, -6.9, -385),
        [19] = Vector3.new(-236.01, -6.9, -372),
        [20] = Vector3.new(-248.01, -6.9, -372),
        [21] = Vector3.new(-260.01, -6.9, -372),
        [22] = Vector3.new(-272.01, -6.9, -372),
        [23] = Vector3.new(-284.01, -6.9, -372),
        [24] = Vector3.new(-296.01, -6.9, -372),
        [25] = Vector3.new(-236.01, -6.9, -359),
        [26] = Vector3.new(-248.01, -6.9, -359),
        [27] = Vector3.new(-260.01, -6.9, -359),
        [28] = Vector3.new(-272.01, -6.9, -359),
        [29] = Vector3.new(-284.01, -6.9, -359),
        [30] = Vector3.new(-296.01, -6.9, -359),
        [31] = Vector3.new(-236.01, -6.9, -346),
        [32] = Vector3.new(-248.01, -6.9, -346),
        [33] = Vector3.new(-260.01, -6.9, -346),
        [34] = Vector3.new(-272.01, -6.9, -346),
        [35] = Vector3.new(-284.01, -6.9, -346),
        [36] = Vector3.new(-296.01, -6.9, -346),
        [37] = Vector3.new(-266.01, -6.9, -355),
        [38] = Vector3.new(-266.01, -6.9, -379),
        [39] = Vector3.new(-266.01, -6.9, -403),
    },
    ["train"] = {
        [1] = Vector3.new(684.99, 34.1, -149),
        [2] = Vector3.new(674.99, 34.1, -149),
        [3] = Vector3.new(664.99, 34.1, -149),
        [4] = Vector3.new(654.99, 34.1, -149),
        [5] = Vector3.new(644.99, 34.1, -149),
        [6] = Vector3.new(634.99, 34.1, -149),
        [7] = Vector3.new(624.99, 34.1, -149),
        [8] = Vector3.new(614.99, 34.1, -149),
        [9] = Vector3.new(604.99, 34.1, -149),
        [10] = Vector3.new(596.45, 34.1, -143.06),
        [11] = Vector3.new(589.38, 34.1, -135.98),
        [12] = Vector3.new(582.31, 34.1, -128.91),
        [13] = Vector3.new(575.24, 34.1, -121.84),
        [14] = Vector3.new(568.17, 34.1, -114.77),
        [15] = Vector3.new(561.99, 34.1, -107),
        [16] = Vector3.new(561.99, 34.1, -97),
        [17] = Vector3.new(561.99, 34.1, -87),
        [18] = Vector3.new(561.99, 34.1, -77),
        [19] = Vector3.new(561.99, 34.1, -67),
        [20] = Vector3.new(561.99, 34.1, -57),
        [21] = Vector3.new(664.99, 47.1, -54),
        [22] = Vector3.new(652.99, 47.1, -54),
        [23] = Vector3.new(640.99, 47.1, -54),
        [24] = Vector3.new(628.99, 47.1, -54),
        [25] = Vector3.new(616.99, 47.1, -54),
        [26] = Vector3.new(604.99, 47.1, -54),
        [27] = Vector3.new(664.99, 47.1, -79),
        [28] = Vector3.new(652.99, 47.1, -79),
        [29] = Vector3.new(640.99, 47.1, -79),
        [30] = Vector3.new(628.99, 47.1, -79),
        [31] = Vector3.new(616.99, 47.1, -79),
        [32] = Vector3.new(604.99, 47.1, -79),
        [33] = Vector3.new(664.99, 47.1, -104),
        [34] = Vector3.new(652.99, 47.1, -104),
        [35] = Vector3.new(640.99, 47.1, -104),
        [36] = Vector3.new(628.99, 47.1, -104),
        [37] = Vector3.new(616.99, 47.1, -104),
        [38] = Vector3.new(604.99, 47.1, -104),
        [39] = Vector3.new(586.99, 47.1, -79),
    },
    ["swamp"] = {
        [1] = Vector3.new(-867.01, -33.9, 263),
        [2] = Vector3.new(-879.01, -33.9, 263),
        [3] = Vector3.new(-891.01, -33.9, 263),
        [4] = Vector3.new(-903.01, -33.9, 263),
        [5] = Vector3.new(-915.01, -33.9, 263),
        [6] = Vector3.new(-927.01, -33.9, 263),
        [7] = Vector3.new(-867.01, -33.9, 276),
        [8] = Vector3.new(-879.01, -33.9, 276),
        [9] = Vector3.new(-891.01, -33.9, 276),
        [10] = Vector3.new(-903.01, -33.9, 276),
        [11] = Vector3.new(-915.01, -33.9, 276),
        [12] = Vector3.new(-927.01, -33.9, 276),
        [13] = Vector3.new(-867.01, -33.9, 289),
        [14] = Vector3.new(-879.01, -33.9, 289),
        [15] = Vector3.new(-891.01, -33.9, 289),
        [16] = Vector3.new(-903.01, -33.9, 289),
        [17] = Vector3.new(-915.01, -33.9, 289),
        [18] = Vector3.new(-927.01, -33.9, 289),
        [19] = Vector3.new(-867.01, -33.9, 302),
        [20] = Vector3.new(-879.01, -33.9, 302),
        [21] = Vector3.new(-891.01, -33.9, 302),
        [22] = Vector3.new(-903.01, -33.9, 302),
        [23] = Vector3.new(-915.01, -33.9, 302),
        [24] = Vector3.new(-927.01, -31.9, 302),
        [25] = Vector3.new(-867.01, -33.9, 315),
        [26] = Vector3.new(-879.01, -33.9, 315),
        [27] = Vector3.new(-891.01, -33.9, 315),
        [28] = Vector3.new(-903.01, -33.9, 315),
        [29] = Vector3.new(-915.01, -33.9, 315),
        [30] = Vector3.new(-927.01, -33.9, 315),
        [31] = Vector3.new(-867.01, -33.9, 328),
        [32] = Vector3.new(-879.01, -33.9, 328),
        [33] = Vector3.new(-891.01, -33.9, 328),
        [34] = Vector3.new(-903.01, -33.9, 328),
        [35] = Vector3.new(-915.01, -33.9, 328),
        [36] = Vector3.new(-927.01, -33.9, 328),
        [37] = Vector3.new(-920.01, -33.9, 334),
        [38] = Vector3.new(-896.01, -33.9, 334),
        [39] = Vector3.new(-872.01, -33.9, 334),
    },
    ["vault"] = {
        [1] = Vector3.new(-496.13, 22.63, -278.12),
        [2] = Vector3.new(-500.13, 22.64, -278.12),
        [3] = Vector3.new(-504.13, 22.65, -278.12),
        [4] = Vector3.new(-508.13, 22.66, -278.12),
        [5] = Vector3.new(-512.13, 22.68, -278.12),
        [6] = Vector3.new(-516.13, 22.69, -278.12),
        [7] = Vector3.new(-496.13, 22.63, -281.12),
        [8] = Vector3.new(-500.13, 22.64, -281.12),
        [9] = Vector3.new(-504.13, 22.65, -281.12),
        [10] = Vector3.new(-508.13, 22.66, -281.12),
        [11] = Vector3.new(-512.13, 22.68, -281.12),
        [12] = Vector3.new(-516.13, 22.69, -281.12),
        [13] = Vector3.new(-496.13, 22.63, -284.12),
        [14] = Vector3.new(-500.13, 22.64, -284.12),
        [15] = Vector3.new(-504.13, 22.65, -284.12),
        [16] = Vector3.new(-508.13, 22.66, -284.12),
        [17] = Vector3.new(-512.13, 22.68, -284.12),
        [18] = Vector3.new(-516.13, 22.69, -284.12),
        [19] = Vector3.new(-496.13, 22.63, -287.12),
        [20] = Vector3.new(-500.13, 22.64, -287.12),
        [21] = Vector3.new(-504.13, 22.65, -287.12),
        [22] = Vector3.new(-508.13, 22.66, -287.12),
        [23] = Vector3.new(-512.13, 22.68, -287.12),
        [24] = Vector3.new(-516.13, 22.69, -287.12),
        [25] = Vector3.new(-496.13, 22.63, -290.12),
        [26] = Vector3.new(-500.13, 22.64, -290.12),
        [27] = Vector3.new(-504.13, 22.65, -290.12),
        [28] = Vector3.new(-508.13, 22.66, -290.12),
        [29] = Vector3.new(-512.13, 22.68, -290.12),
        [30] = Vector3.new(-516.13, 22.69, -290.12),
        [31] = Vector3.new(-496.13, 22.63, -293.12),
        [32] = Vector3.new(-500.13, 22.64, -293.12),
        [33] = Vector3.new(-504.13, 22.65, -293.12),
        [34] = Vector3.new(-508.13, 22.66, -293.12),
        [35] = Vector3.new(-512.13, 22.68, -293.12),
        [36] = Vector3.new(-516.13, 22.69, -293.12),
        [37] = Vector3.new(-493.13, 22.62, -289.12),
        [38] = Vector3.new(-493.13, 22.62, -282.12),
        [39] = Vector3.new(-519.38, 23.2, -285.62),
    },
    ["bankroof"] = {
        [1] = Vector3.new(-447.08, 38.5, -269.12),
        [2] = Vector3.new(-460.08, 38.54, -269.12),
        [3] = Vector3.new(-473.08, 38.57, -269.12),
        [4] = Vector3.new(-486.08, 38.61, -269.12),
        [5] = Vector3.new(-499.08, 38.64, -269.12),
        [6] = Vector3.new(-512.08, 38.68, -269.12),
        [7] = Vector3.new(-447.08, 38.5, -276.12),
        [8] = Vector3.new(-460.08, 38.54, -276.12),
        [9] = Vector3.new(-473.08, 38.57, -276.12),
        [10] = Vector3.new(-486.08, 38.61, -276.12),
        [11] = Vector3.new(-499.08, 38.64, -276.12),
        [12] = Vector3.new(-512.08, 38.68, -276.12),
        [13] = Vector3.new(-447.08, 38.5, -283.12),
        [14] = Vector3.new(-460.08, 38.54, -283.12),
        [15] = Vector3.new(-473.08, 38.57, -283.12),
        [16] = Vector3.new(-486.08, 38.61, -283.12),
        [17] = Vector3.new(-499.08, 38.64, -283.12),
        [18] = Vector3.new(-512.08, 38.68, -283.12),
        [19] = Vector3.new(-512.08, 38.68, -290.12),
        [20] = Vector3.new(-499.08, 38.64, -290.12),
        [21] = Vector3.new(-486.08, 38.61, -290.12),
        [22] = Vector3.new(-473.08, 38.57, -290.12),
        [23] = Vector3.new(-460.08, 38.54, -290.12),
        [24] = Vector3.new(-447.08, 38.5, -290.12),
        [25] = Vector3.new(-512.08, 38.68, -297.12),
        [26] = Vector3.new(-499.08, 38.64, -297.12),
        [27] = Vector3.new(-486.08, 38.61, -297.12),
        [28] = Vector3.new(-473.08, 38.57, -297.12),
        [29] = Vector3.new(-460.08, 38.54, -297.12),
        [30] = Vector3.new(-447.08, 38.5, -297.12),
        [31] = Vector3.new(-512.08, 38.68, -304.12),
        [32] = Vector3.new(-499.08, 38.64, -304.12),
        [33] = Vector3.new(-486.08, 38.61, -304.12),
        [34] = Vector3.new(-473.08, 38.57, -304.12),
        [35] = Vector3.new(-460.08, 38.54, -304.12),
        [36] = Vector3.new(-447.08, 38.5, -304.12),
        [37] = Vector3.new(-437.08, 38.47, -277.12),
        [38] = Vector3.new(-437.08, 38.47, -285.12),
        [39] = Vector3.new(-437.08, 38.47, -292.12),
    },
    ["basketball"] = {
        [1] = Vector3.new(-873.01, 22.1, -518),
        [2] = Vector3.new(-896.01, 22.1, -518),
        [3] = Vector3.new(-919.01, 22.1, -518),
        [4] = Vector3.new(-942.01, 22.1, -518),
        [5] = Vector3.new(-965.01, 22.1, -518),
        [6] = Vector3.new(-988.01, 22.1, -518),
        [7] = Vector3.new(-873.01, 22.1, -503),
        [8] = Vector3.new(-896.01, 22.1, -503),
        [9] = Vector3.new(-919.01, 22.1, -503),
        [10] = Vector3.new(-942.01, 22.1, -503),
        [11] = Vector3.new(-965.01, 22.1, -503),
        [12] = Vector3.new(-988.01, 22.1, -503),
        [13] = Vector3.new(-873.01, 22.1, -488),
        [14] = Vector3.new(-896.01, 22.1, -488),
        [15] = Vector3.new(-919.01, 22.1, -488),
        [16] = Vector3.new(-942.01, 22.1, -488),
        [17] = Vector3.new(-965.01, 22.1, -488),
        [18] = Vector3.new(-988.01, 22.1, -488),
        [19] = Vector3.new(-873.01, 22.1, -473),
        [20] = Vector3.new(-896.01, 22.1, -473),
        [21] = Vector3.new(-919.01, 22.1, -473),
        [22] = Vector3.new(-942.01, 22.1, -473),
        [23] = Vector3.new(-965.01, 22.1, -473),
        [24] = Vector3.new(-988.01, 22.1, -473),
        [25] = Vector3.new(-873.01, 22.1, -458),
        [26] = Vector3.new(-896.01, 22.1, -458),
        [27] = Vector3.new(-919.01, 22.1, -458),
        [28] = Vector3.new(-942.01, 22.1, -458),
        [29] = Vector3.new(-965.01, 22.1, -458),
        [30] = Vector3.new(-988.01, 22.1, -458),
        [31] = Vector3.new(-873.01, 22.1, -443),
        [32] = Vector3.new(-896.01, 22.1, -443),
        [33] = Vector3.new(-919.01, 22.1, -443),
        [34] = Vector3.new(-942.01, 22.1, -443),
        [35] = Vector3.new(-965.01, 22.1, -443),
        [36] = Vector3.new(-988.01, 22.1, -443),
        [37] = Vector3.new(-863.55, 19.59, -473.71),
        [38] = Vector3.new(-863.55, 19.59, -490.71),
        [39] = Vector3.new(-866.55, 19.59, -482.21),
    },
}

--Functions
local function commaValue(amount)
	local formatted = amount
	local k
	while true do  
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end
	return formatted
end

local function findPlayer(name)
	if name then
        --If they typed the name exactly, then return that
        if Players:FindFirstChild(name) then return Players[name] end

        --Otherwise search for player name match
		name = name:lower()

		for _, player in ipairs(Players:GetPlayers()) do
			if name == player.Name:lower():sub(1, #name) then
				return player
			end
		end
	end
	return nil
end

local function getAltNumber(userId)
    for i, id in ipairs(getgenv().alts) do
        if userId == id then
            return i
        end
    end
    return false
end

local altsCache = {} -- [userId] == true / nil
local function isAlt(userId)
    if altsCache[userId] == true then
        return true
    elseif altsCache[userId] == false then
        return false
    else
        for i, id in ipairs(getgenv().alts) do
            if userId == id then
                altsCache[userId] = true
                return true
            end
        end
        altsCache[userId] = false
        return false
    end
end

local function teleport(cframeLocation)
    PLAYER.Character.HumanoidRootPart.CFrame = cframeLocation
    --feetPlatform.Position = PLAYER.Character.HumanoidRootPart.Position + Vector3.new(0, -3, 0)
end

local function isCharacterLoaded(player)
    if player.Character then
        for partName, _ in pairs(REQUIRED_CHAR_PARTS) do
            if not player.Character:FindFirstChild(partName) then
                return false
            end
        end
        return true
    else
        return false
    end
end

local function cancelVelocity(enabled)
    while PLAYER.Character == nil do task.wait() end
    local humanoidRootPart = PLAYER.Character:WaitForChild("HumanoidRootPart")

	if enabled == true then
		if not humanoidRootPart:FindFirstChild("CustomVelocity") then 
			local vel = Instance.new("BodyVelocity")
			vel.MaxForce = Vector3.new(1, 1, 1) * math.huge
			vel.P = math.huge
			vel.Velocity = Vector3.new(0, 0, 0)
			vel.Name = "CustomVelocity"
			vel.Parent = humanoidRootPart
		end
	else
		if humanoidRootPart:FindFirstChild("CustomVelocity") then 
			humanoidRootPart:FindFirstChild("CustomVelocity"):Destroy()
		end
	end
end

---Setup---
if PLAYER.UserId == getgenv().mainId then -- Player is main
    
elseif isAlt(PLAYER.UserId) == true then -- Player is alt
    --AltGuiLite (of 'ScreenGui' class)
    local AltGuiLite = Instance.new("ScreenGui")
    AltGuiLite.Name = "AltGuiLite"
    AltGuiLite.IgnoreGuiInset = true
    AltGuiLite.Parent = CORE_GUI

    --Create instances
    local LiteBackground = Instance.new("Frame")
    local LiteTitle = Instance.new("TextLabel")
    local LiteUIGradient = Instance.new("UIGradient")
    local LiteDesc = Instance.new("TextLabel")
    local LiteLeaveBtn = Instance.new("TextButton")

    --Set attributes
    LPH_JIT_MAX(function()
        LiteBackground.Name = "LiteBackground"
        LiteBackground.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
        LiteBackground.BackgroundColor3 = Color3.new(1, 1, 1)
        LiteBackground.Size = UDim2.new(1, 0, 1, 0)
        LiteBackground.Parent = AltGuiLite
        LiteTitle.Name = "LiteTitle"
        LiteTitle.LayoutOrder = 1
        LiteTitle.TextTransparency = 0.4000000059604645
        LiteTitle.TextStrokeTransparency = 0.75
        LiteTitle.AnchorPoint = Vector2.new(0.5, 0.5)
        LiteTitle.Size = UDim2.new(0.5, 0, 0.075, 0)
        LiteTitle.TextColor3 = Color3.new(1, 1, 1)
        LiteTitle.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
        LiteTitle.Text = "Username | Nickname | UserId"
        LiteTitle.TextSize = 14
        LiteTitle.Font = Enum.Font.SourceSans
        LiteTitle.BackgroundTransparency = 1
        LiteTitle.Position = UDim2.new(0.5, 0, 0.475, 0)
        LiteTitle.TextScaled = true
        LiteTitle.BackgroundColor3 = Color3.new(1, 1, 1)
        LiteTitle.Parent = LiteBackground
        LiteUIGradient.Name = "LiteUIGradient"
        LiteUIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),ColorSequenceKeypoint.new(1, Color3.new(0.176471, 0.176471, 0.176471)),}
        LiteUIGradient.Rotation = 290
        LiteUIGradient.Parent = LiteBackground
        LiteDesc.Name = "LiteDesc"
        LiteDesc.LayoutOrder = 1
        LiteDesc.TextTransparency = 0.4000000059604645
        LiteDesc.TextStrokeTransparency = 0.75
        LiteDesc.AnchorPoint = Vector2.new(0.5, 0.5)
        LiteDesc.Size = UDim2.new(0.5, 0, 0.049, 0)
        LiteDesc.TextColor3 = Color3.new(1, 1, 1)
        LiteDesc.RichText = true
        LiteDesc.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
        LiteDesc.Text = "Cash: <font color='rgb(0,255,0)'>$0</font>"
        LiteDesc.TextSize = 14
        LiteDesc.Font = Enum.Font.SourceSans
        LiteDesc.BackgroundTransparency = 1
        LiteDesc.Position = UDim2.new(0.5, 0, 0.535, 0)
        LiteDesc.TextScaled = true
        LiteDesc.BackgroundColor3 = Color3.new(1, 1, 1)
        LiteDesc.Parent = LiteBackground
        LiteLeaveBtn.Name = "LiteLeaveBtn"
        LiteLeaveBtn.TextTransparency = 0.5
        LiteLeaveBtn.TextStrokeTransparency = 0.75
        LiteLeaveBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        LiteLeaveBtn.Size = UDim2.new(0.079, 0, 0.05, 0)
        LiteLeaveBtn.TextColor3 = Color3.new(1, 1, 1)
        LiteLeaveBtn.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
        LiteLeaveBtn.Text = "Leave"
        LiteLeaveBtn.TextSize = 14
        LiteLeaveBtn.Font = Enum.Font.SourceSans
        LiteLeaveBtn.BackgroundTransparency = 0.5
        LiteLeaveBtn.Position = UDim2.new(0.5, 0, 0.625, 0)
        LiteLeaveBtn.TextScaled = true
        LiteLeaveBtn.BackgroundColor3 = Color3.new(0, 0, 0)
        LiteLeaveBtn.Parent = LiteBackground

        --Secondary instances
        local secondaryInsts = {{["ClassName"] = "UICorner", ["Parent"] = LiteLeaveBtn, ["Properties"] = {}},}
        for _, instInfo in ipairs(secondaryInsts) do
            local inst = Instance.new(instInfo.ClassName)
            for propertyName, value in pairs(instInfo.Properties) do
                inst[propertyName] = value
            end
            inst.Parent = instInfo.Parent
        end
    end)();

    --Vars
    local playerOldPosition
    local destroyCash = false
    local dropToggle = false
    local graved = false
    local frozen = false

    --Username | DisplayName | UserId
    LiteTitle.Text = PLAYER.Name.." | "..PLAYER.DisplayName.." | "..PLAYER.UserId

    --Current cash
    LiteDesc.Text = "Cash: <font color='rgb(0,255,0)'>$"..commaValue(PLAYER_CASH.Value).."</font>"
    PLAYER_CASH.Changed:Connect(function(newValue)
        LiteDesc.Text = "Cash: <font color='rgb(0,255,0)'>$"..commaValue(newValue).."</font>"
    end

    --Cash added
    IGNORED.Drop.ChildAdded:Connect(function(child)
        if child:IsA("Part") then
            task.wait(5)
            child.Transparency = 1
            child:WaitForChild("Decal"):Destroy()
            child:WaitForChild("Decal"):Destroy()
            child:WaitForChild("BillboardGui").Enabled = false
            if destroyCash == true and child.Parent ~= nil then
                child:Destroy()
            end
        end
    end)

    --Alt commands
    local altCommands = {}
    --local crouchAnim = PLAYER.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Block)
    altCommands.drop = function(player, args)
        dropToggle = not dropToggle
        local player = findPlayer(args[1])
        if player and player ~= PLAYER then
            return
        end

        if dropToggle == false then
            MAIN_EVENT:FireServer("Block", false) -- (doesn't work if stuff in IGNORED is destroyed)
            CHAT_EVENT:FireServer("Stopped Dropping", "All")
        elseif dropToggle == true then
            MAIN_EVENT:FireServer("Block", true)
            CHAT_EVENT:FireServer("Started Dropping", "All")
        end

        task.spawn(function()
            while dropToggle == true and PLAYER_CASH.Value >= 10000 do
                MAIN_EVENT:FireServer("DropMoney", 10000)
                --DropTime.Visible = true
                for count = 15, 1, -1 do
                    if dropToggle == true then
                        --DropTime.Text = count.."s"
                        task.wait(1)
                    else
                        break
                    end
                end
                task.wait(0.15)
            end

            MAIN_EVENT:FireServer("Block", false) -- (doesn't work if stuff in IGNORED is destroyed)
        end)
    end

    altCommands.stop = function(player, args)
        dropToggle = false
        CHAT_EVENT:FireServer("Stopped", "All")
    end

    altCommands.freeze = function(player, args)
        local player = findPlayer(args[1])
        frozen = not frozen

        if player == PLAYER or args[1] == nil then
            PLAYER.Character.HumanoidRootPart.Anchored = true
        end
    end
    
    altCommands.setup = function(player, args)
        local locationName = tostring(args[1]) -- tostring incase nil

        while not isCharacterLoaded(PLAYER) do task.wait() end
        local altNumber = getAltNumber(PLAYER.UserId)
        teleport(CFrame.new(ALT_SETUP_LOCATIONS_V2[locationName][altNumber]))
    end

    altCommands.bring = function(player, args)
        local player = findPlayer(args[1])
        if player and player ~= PLAYER then
            return
        end

        teleport(CFrame.new(player.Character.HumanoidRootPart.Position))
    end

    altCommands.grave = function(player, args)
        local player = findPlayer(args[1])
        if player and player ~= PLAYER then
            return
        end
        graved = not graved

        if graved == true then
            teleport(CFrame.new(PLAYER.Character.HumanoidRootPart.Position + Vector3.new(0, -6.5, 0)))
        elseif graved == false then
            teleport(CFrame.new(PLAYER.Character.HumanoidRootPart.Position + Vector3.new(0, 6.5, 0)))
        end
    end

    altCommands.loopdestroy = function(player, args)
        LPH_JIT_MAX(function()
            for _,v in ipairs(IGNORED.Drop:GetChildren()) do
                if v:IsA("Part") then
                    v:Destroy()
                end
            end
        end)();
        destroyCash = true
        CHAT_EVENT:FireServer("Loop Destroying Cash", "All")
    end

    --Buttons
    LiteLeaveBtn.MouseButton1Down:Connect(function()
        PLAYER:Kick()
    end)

    --Players
    local function characterAppearanceLoadedAltVersion(character, player)
        if player ~= PLAYER then
            --player is someone else
        else
            character:WaitForChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            cancelVelocity(true)
        end

        task.wait(1)
        --Destroy accessories for optimisation
        for _, v in ipairs(character:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("ShirtGraphic") or v:IsA("Pants") then
                v:Destroy()
            elseif v.Name == "Head" then
                task.spawn(function()
                    local face = v:WaitForChild("face", 5)
                    if face then face:Destroy() end
                end)
            end
        end
    end

    local function setupPlayerAltVersion(player)
        player.Chatted:Connect(function(message)
            local splitString = message:split(" ")
            local cmdName = string.lower(splitString[1]:split(".")[2])
    
            if altCommands[cmdName] and getgenv().mainId and player.UserId == getgenv().mainId then
                local args = {}
    
                for i = 2, #splitString, 1 do
                    table.insert(args, splitString[i])
                end
    
                altCommands[cmdName](player, args)
            end
        end)

        while not isCharacterLoaded(player) do task.wait() end -- wait until player has loaded
        local character = player.Character

        characterAppearanceLoadedAltVersion(character, player)
        player.CharacterAdded:Connect(function(character)
            while not isCharacterLoaded(player) do task.wait() end -- wait until player has fully loaded
            characterAppearanceLoadedAltVersion(character, player)
        end)
    end
    for _, player in ipairs(Players:GetPlayers()) do
        task.spawn(function()
            setupPlayerAltVersion(player)
        end)
    end
    Players.PlayerAdded:Connect(setupPlayerAltVersion)
end
