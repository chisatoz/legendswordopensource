spawn(
    function()
        while wait() do
            pcall(
                function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
                end
            )
        end
    end
)
if _G.Hop then
    local Player = game.Players.LocalPlayer
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"

    local _place, _id = game.PlaceId, game.JobId
    local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=10"
    function ListServers(cursor)
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
        return Http:JSONDecode(Raw)
    end

    time_to_wait = 10
    while wait(time_to_wait) do
        local Servers = ListServers()
        local Server = Servers.data[math.random(1, #Servers.data)]
        TPS:TeleportToPlaceInstance(_place, Server.id, Player)
    end
end
