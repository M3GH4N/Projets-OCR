<#

Auteur : Méghan Rigoli
Date : 14/08/2022
Version : 1.0
Description : Ce script permet de créer un utilisateur dans l'AD ainsi que son dossier de partage personnel

Sources :
New-ADUser : https://rdr-it.com/howto/active-directory-creer-un-utilisateur-avec-powershell/
SMB-Share : https://www.it-connect.fr/chapitres/creation-dun-partage-smb-en-powershell/

#>

# On demande le Prénom et le Nom du nouvel utilisateur
$givenName = Read-Host "Merci d'entrer le Prénom"
$surname = Read-Host "Merci d'entrer le Nom"

# On demande le mot de passe du nouvel utilisateur
$accountPassword = Read-Host "Merci d'entrer le Mot de passe"

# Automatisation du Prénom Nom
$name = ($givenName +' '+ $surname)

# Automatisation du Login
$samAccountName = ($givenName.Substring(0,1) +'.'+ $surname)

# Automatisation de l'adresse e-mail
$userPrincipalName = ($samAccountName+"@axeplane.loc")

# Création du nouvel utilisateur dans l'AD et intégration dans son groupe de sécurité et OU associé
$continue = $true
while ($continue){
  write-host “Sélectionner le groupe de sécurité du nouvel utilisateur”
  write-host “1. Directeur général"
  write-host "2. Directeur adjoint"
  write-host "3. Secrétaire de direction"
  write-host "4. Directrice des Ressources Humaines"
  write-host "5. Assistants RH"
  write-host "6. Responsable service Finance"
  write-host "7. Gestionnaire finances comptabilité"
  write-host "8. Assistante comptable"
  write-host "9. Responsable service Commercial"
  write-host "10. Commercial"
  write-host "11. Responsable service Logistique"
  write-host "12. Opérateur logistique"
  write-host "13. Responsable service Marketing"
  write-host "14. Assistant marketing"
  write-host "15. Stagiaire service Marketing"
  write-host "16. Responsable service Informatique"
  write-host "17. Administrateur Systèmes et Réseaux"
  write-host "18. Technicien Supérieur Systèmes et Réseaux"
  $choix = read-host “faire un choix :”
  switch ($choix){
    1{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Direction,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Directeur général" -Members $samAccountName
    $continue = $false}
    2{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Direction,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Directeur adjoint" -Members $samAccountName
    $continue = $false}
    3{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Direction,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Secrétaire de direction" -Members $samAccountName
    $continue = $false}
    4{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=RH,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Directrice des Ressources Humaines" -Members $samAccountName
    $continue = $false}
    5{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=RH,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Assistants RH" -Members $samAccountName
    $continue = $false}
    6{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Finance,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Responsable service Finance" -Members $samAccountName
    $continue = $false}
    7{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Finance,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Gestionnaire finances comptabilité" -Members $samAccountName
    $continue = $false}
    8{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Finance,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Assistante comptable" -Members $samAccountName
    $continue = $false}
    9{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Commercial,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Responsable service Commercial" -Members $samAccountName
    $continue = $false}
    10{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Commercial,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Commercial" -Members $samAccountName
    $continue = $false}
    11{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Logistique,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Responsable service Logistique" -Members $samAccountName
    $continue = $false}
    12{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Logistique,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Opérateur logistique" -Members $samAccountName
    $continue = $false}
    13{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Marketing,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Responsable service Marketing" -Members $samAccountName
    $continue = $false}
    14{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Marketing,DC=axeplane,DC=LOC"
    Add-AdGroupMember -Identity "Assistant marketing" -Members $samAccountName
    $continue = $false}
    15{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Stagiaire,DC=axeplane,DC=LOC" 
    Add-AdGroupMember -Identity "Stagiaire service Marketing" -Members $samAccountName
    $continue = $false}
    16{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Informatique,DC=axeplane,DC=LOC" 
    Add-AdGroupMember -Identity "Responsable service Informatique" -Members $samAccountName
    $continue = $false}
    17{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Informatique,DC=axeplane,DC=LOC" 
    Add-AdGroupMember -Identity "Administrateur Systèmes et Réseaux" -Members $samAccountName
    $continue = $false}
    18{New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -Enable $true -Path "OU=Informatique,DC=axeplane,DC=LOC" 
    Add-AdGroupMember -Identity "Technicien Supérieur Systèmes et Réseaux -Members" $samAccountName
    $continue = $false}
‘x’ {$continue = $false}
    default {Write-Host "Choix invalide"-ForegroundColor Red}
  }
}

# Création du dossier personnel
New-Item -Name $samAccountName -Path ("E:\Partages personnels utilisateurs\") -ItemType Directory 

# Création du partage dossier personnel
New-SmbShare -Name ($samAccountName + "$") -Path ("E:\Partages personnels utilisateurs\" + $samAccountName) -ChangeAccess $samAccountName -FullAccess "Administrateurs"

# On indique que la création du nouvel utilisateur a bien été effectué
Write-Output "Le nouvel utilisateur $samAccountName a été créé"

# On affiche le nouvel utilisateur créé dans l'AD ainsi que sa date de création 
Get-Aduser $samAccountName -Properties whenCreated | Select-Object name,givenName,surname,userPrincipalName,whenCreated| Ft