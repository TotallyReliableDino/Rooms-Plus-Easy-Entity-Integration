-- Define your extension function (MakeEntity)
local function MakeEntity(
    entityName, entityColor, nearSoundID, spawnNextRoom, pointLightColor, chasePlayers, minRebounds, imageID, farSoundID, waitTime, speed, maxRebounds, deathMessage, roughness,
    fadeIn, fadeOut, farSoundVol, farSoundSpeed, magnitude, lightBrightness, nearSoundSpeed, nearSoundVol, killRange, lightRange, reboundTime, autoToSave
)
    -- Set default values
    entityName = entityName or "Unnamed Entity"
    print("Creating entity:", entityName)

    -- Construct arguments table
    local args = {
        EntityName = entityName,
        NearSoundID = nearSoundID or "rbxassetid://00000000000",
        PointLightColor = pointLightColor or Color3.new(1, 1, 1),
        ChasePlayers = chasePlayers or false,
        MinRebounds = minRebounds or 1,
        ImageID = imageID or "rbxassetid://00000000000",
        FarSoundID = farSoundID or "rbxassetid://00000000000",
        WaitTime = waitTime or 5,
        Speed = speed or 450,
        MaxRebounds = maxRebounds or 7,
        DeathMessage = deathMessage or "Entity death message",
        Roughness = roughness or 50,
        FadeIn = fadeIn or 0,
        FadeOut = fadeOut or 0,
        FarSoundVol = farSoundVol or 100,
        FarSoundSpeed = farSoundSpeed or 1,
        Magnitude = magnitude or 50,
        LightBrightness = lightBrightness or 50,
        NearSoundSpeed = nearSoundSpeed or 1,
        NearSoundVol = nearSoundVol or 100,
        KillRange = killRange or 100,
        LightRange = lightRange or 100,
        ReboundTime = reboundTime or 0
    }

    -- Fire server event with arguments
    game:GetService("ReplicatedStorage"):WaitForChild("Bricks"):WaitForChild("CreateEntityNew"):FireServer(args)

    -- If autoToSave is true, call AddEntityToSave
    if autoToSave then
        AddEntityToSave(
            entityName, nearSoundID, farSoundID, nearSoundSpeed, farSoundVol, farSoundSpeed, nearSoundID, nearSoundVol, pointLightColor, lightBrightness, lightRange, imageID, speed,
            waitTime, minRebounds, maxRebounds, spawnNextRoom, chasePlayers, reboundTime, killRange, magnitude, roughness, fadeIn, fadeOut, deathMessage
        )
    end
end

-- Define your extension function (AddEntityToSave)
local function AddEntityToSave(
    entityName, nearSoundID, farSoundID, nearSoundSpeed, farSoundVol, farSoundSpeed, nearSoundID, nearSoundVol, pointLightColor, lightBrightness, lightRange, imageID, speed, waitTime,
    minRebounds, maxRebounds, spawnNextRoom, chasePlayers, reboundTime, killRange, magnitude, roughness, fadeIn, fadeOut, deathMessage
)
    -- Set default values
    entityName = entityName or "Unnamed Entity"
    pointLightColor = pointLightColor or Color3.new(1, 1, 1)

    -- Construct properties table
    local properties = {
        { Name = "ModelID", Class = "StringValue", Value = imageID or "rbxassetid://00000000000" },
        { Name = "NearSoundSpeed", Class = "NumberValue", Value = nearSoundSpeed or 1 },
        { Name = "FarSoundID", Class = "StringValue", Value = farSoundID or "rbxassetid://00000000000" },
        { Name = "FarSoundVol", Class = "NumberValue", Value = farSoundVol or 100 },
        { Name = "FarSoundMax", Class = "NumberValue" },
        { Name = "FarSoundMin", Class = "NumberValue" },
        { Name = "NearSoundID", Class = "StringValue", Value = nearSoundID or "rbxassetid://00000000000" },
        { Name = "NearSoundVol", Class = "NumberValue", Value = nearSoundVol or 100 },
        { Name = "NearSoundMax", Class = "NumberValue" },
        { Name = "NearSoundMin", Class = "NumberValue" },
        { Name = "OutSpinningID", Class = "StringValue", Value = "" },
        { Name = "OutFlyingID", Class = "StringValue", Value = "" },
        { Name = "SecondImageID", Class = "StringValue", Value = "" },
        { Name = "PointLightColor", Class = "StringValue", Value = pointLightColor },
        { Name = "LightBrightness", Class = "NumberValue", Value = lightBrightness or 50 },
        { Name = "LightRange", Class = "NumberValue", Value = lightRange or 100 },
        { Name = "EntityName", Class = "StringValue", Value = entityName },
        { Name = "FarSoundSpeed", Class = "NumberValue", Value = farSoundSpeed or 1 },
        { Name = "ImageID", Class = "StringValue", Value = imageID or "rbxassetid://00000000000" },
        { Name = "Speed", Class = "NumberValue", Value = speed or 1 },
        { Name = "WaitTime", Class = "NumberValue", Value = waitTime or 5 },
        { Name = "MinRebounds", Class = "NumberValue", Value = minRebounds or 1 },
        { Name = "MaxRebounds", Class = "NumberValue", Value = maxRebounds or 4 },
        { Name = "SpawnNextRoom", Class = "BoolValue", Value = spawnNextRoom or true },
        { Name = "ChasePlayers", Class = "BoolValue", Value = chasePlayers or false },
        { Name = "ReboundTime", Class = "NumberValue", Value = reboundTime or 0 },
        { Name = "KillRange", Class = "NumberValue", Value = killRange or 100 },
        { Name = "Magnitude", Class = "NumberValue", Value = magnitude or 50 },
        { Name = "Roughness", Class = "NumberValue", Value = roughness or 50 },
        { Name = "FadeIn", Class = "NumberValue", Value = fadeIn or 0 },
        { Name = "FadeOut", Class = "NumberValue", Value = fadeOut or 0 },
        { Name = "DeathMessage", Class = "StringValue", Value = deathMessage or "Entity death message" }
    }

    -- Construct arguments table
    local args = {
        [1] = {
            Name = entityName,
            Properties = properties
        }
    }

    -- Fire server event with arguments
    game:GetService("ReplicatedStorage"):WaitForChild("Bricks"):WaitForChild("EntityCreator"):WaitForChild("SaveEntity"):FireServer(unpack(args))
end

-- Example usage of the functions
-- MakeEntity("MyEntity", nil, nil, false, Color3.new(1, 1, 1), false, 1, nil, nil, 5, 450, 7, "Entity death message", 50, 0, 0, 100, 1, 50, 50, 1, 100, 100, 0, true)
