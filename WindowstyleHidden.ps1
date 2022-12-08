<#

Auteur : Méghan Rigoli
Date : 04/09/2022
Version : 1.0
Description : Ce script permet de cacher et executer un autre script

Source : https://www.delftstack.com/howto/powershell/powershell.exe-hidden/

#>

# On cache la fenêtre du script pour les utilisateurs
PowerShell.exe -windowstyle hidden {\\SRV-AD.axeplane.loc\Scripts\SAUVEGARDE_PLANIFIEE.ps1}