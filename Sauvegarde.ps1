<#

Auteur : Méghan Rigoli
Date : 11/09/2022
Version : 1.0
Description : Ce script permet de sauvegarder le C:\Users de chaque utilisateur s'étant déjà connecté à l'ordinateur. 
Les dossiers Bureau, Documents et Téléchargements sont copiés sur le serveur dans le dossier E:\Sauvegardes\Users.

Sources : https://docs.microsoft.com/fr-fr/windows-server/administration/windows-commands/robocopy
https://sourceforge.net/projects/robocoprobocopy/

#>

# Déclarer le chemin source pour la sauvegarde
$source = "\\DK-DIRECTION\C`$\Users\"

# Déclarer le chemin de destination de la sauvegarde 
$dest = "E:\Sauvegardes\"

# Déclarer les dossiers qui seront copiés depuis le chemin source : Bureau, Documents et Téléchargements. 
$arrayUsers = Get-Item -Path $source\* 

# Déclarer les dossiers qui seront copiés depuis le chemin source : Bureau, Documents et Téléchargements. 
$arrayFolders = @('Desktop','Documents','Downloads')

# Pour chaque dossier dans le champ des dossiers définis dans la variable $array, copie les dossiers en miroir en excluant les images, vidéos et photos.
foreach ($user in $arrayUsers) { 
    foreach ($folder in $arrayFolders) { 
    Robocopy $user\$folder $dest\$user\$folder /MIR /R:2 /W:5 /V /ETA
    }
}

# On copie les dossiers des utilisateurs dans le répertoire E:\Sauvegardes
Copy-Item -Path "E:\Sauvegardes\DK-DIRECTION\C$\Users\*" -Destination $dest -Force -Recurse

# On supprime l'ancien dossier de sauvegarde
$FileName = 'E:\Sauvegardes\DK-DIRECTION'
If (Test-Path $FileName){
   Remove-Item $FileName -Force -Recurse
}