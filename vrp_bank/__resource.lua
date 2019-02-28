--Script by DarkHaze1498 Revolution-Roleplay.de--

description "vRP bank"

dependency "vrp"

client_scripts{
    "cfg/bank.lua",
    "client.lua"
}

server_script{
    "@vrp/lib/utils.lua"
    "cfg/bank.lua"
    "server.lua"
}