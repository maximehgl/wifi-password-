
DIM oWsh, commande
Set oWsh = WScript.CreateObject("WScript.Shell")
commande = "mdp_wifi.bat"
oWsh.Run commande,0
