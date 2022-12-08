<#

Auteur : Méghan Rigoli
Date : 14/08/2022
Version : 1.0
Description : Ce script permet d'afficher les groupes d'un membre AD en entrant le Login de l'utilisateur et réalise un export de celui-ci dans \Documents\TEMP_GROUPES_MEMBRE\ au format .cvs

Sources :
Pour Test-Path : https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-path?view=powershell-7.2
Pour ADGroupMembership : https://shellgeek.com/get-adprincipalgroupmembership-active-directory/

#>

# On demande le Login de l'utilisateur
$user = Read-Host "Merci d'entrer le Login de l'utilisateur :"

# On teste si un fichier existe déjà avec le nom de l'utilisateur, si c'est le cas il est supprimé
$FileName = "C:\Users\Administrateur\Documents\TEMP_GROUPES_MEMBRE\Groupes_Membre_$user"
If (Test-Path $FileName){
   Remove-Item $FileName
}

# On indique la création du nouveau fichier
Write "Création du nouveau fichier Groupes_Membre_$user dans \Documents\TEMP_GROUPES_MEMBRE\"

# Création et export du nouveau fichier dans \Documents\TEMP_GROUPES_MEMBRE\ et portant le nom Groupes_Membre_Login.cvs
Get-ADPrincipalGroupMembership -Identity $user |  Get-ADGroup | Select distinguishedName | Export-CSV C:\Users\Administrateur\Documents\TEMP_GROUPES_MEMBRE\Groupes_Membre_$user.csv 

# On affiche le résultat 
Get-ADPrincipalGroupMembership -Identity $user | Get-ADGroup | Select distinguishedName