<#

Auteur : Méghan Rigoli
Date : 03/09/2022
Version : 1.0
Description : Ce script permet de sauvegarder le C:\Users de chaque utilisateur, dossiers Bureau, Documents et Téléchargements sur le serveur dans le dossier E:\Sauvegardes\Users.

Sources : https://docs.microsoft.com/fr-fr/windows-server/administration/windows-commands/robocopy
https://sourceforge.net/projects/robocoprobocopy/

#>

# Déclarer le chemin source pour la sauvegarde
$source = "C:\Users\$env:USERNAME\"

# Déclarer le chemin de destination de la sauvegarde 
$dest = "\\SRV-AD\Sauvegardes\$env:USERNAME\"

# Déclarer les dossiers qui seront copiés depuis le chemin source : Bureau, Documents et Téléchargements. 
$array = @('Desktop','Documents','Downloads')

# Pour chaque dossier dans le champ des dossiers définis dans la variable $array, copie les dossiers en miroir en excluant les images, vidéos et photos.
foreach ($folder in $array) { 
    Robocopy $source\$folder $dest\$folder /MIR /XD "C:\Users\$env:USERNAME\Pictures" "C:\Users\$env:USERNAME\Documents\Mes images" "C:\Users\$env:USERNAME\Music" "C:\Users\$env:USERNAME\Documents\Ma musique" "C:\Users\$env:USERNAME\Videos" "C:\Users\$env:USERNAME\Documents\Mes vidéos" /R:2 /W:5
}