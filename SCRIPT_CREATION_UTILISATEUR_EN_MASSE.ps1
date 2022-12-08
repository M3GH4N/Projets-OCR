<#

Auteur : Méghan Rigoli
Date : 14/08/2022
Version : 1.0
Description : Ce script permet de créer des utilisateurs en masse dans l'AD à partir d'un fichier en format .cvs

Sources :
Inspiré du tutoriel : https://www.it-connect.fr/chapitres/creer-des-utilisateurs-dans-lad-a-partir-dun-csv/
Pour la cmd GetADUser avec whenCreated : https://www.it-connect.fr/chapitres/recuperer-des-informations-sur-les-utilisateurs-avec-powershell/
Pour ajouter les utilisateurs à leur groupe cmd Add-ADGroupMember : https://www.it-connect.fr/chapitres/ajouter-ou-retirer-des-membres-dun-groupe-ad/

#> 

# On importe le fichier en format .cvs contenant les informations : Prénom, Nom, Service, Fonction
$CSVFile = "C:\Users\Administrateur\Desktop\SCRIPT\SCRIPTS OK\CREATION UTILISATEURS EN MASSE\utilisateurs.csv"
$CSVData = Import-CSV -Path $CSVFile -Delimiter ";" -Encoding UTF8

# On déclare une boucle pour l'alimenter des informations du fichier.cvs
Foreach($Utilisateur in $CSVData){
    # On cherche dans le fichier.cvs les informations : Prénom, Nom, Fonction et Service des nouveaux utilisateurs
    $givenName = $Utilisateur.givenName
    $surname = $Utilisateur.surname
    $Fonction = $Utilisateur.Fonction
    $Service = $Utilisateur.Service
    # Automatisation des Prénom Nom
    $name = ($givenName +' '+ $surname)
    # Automatisation des Login
    $samAccountName = ($givenName.Substring(0,1) +'.'+ $surname)
    # Automatisation des adresses e-mail
    $userPrincipalName = ($samAccountName+"@axeplane.loc")
    # Mot de passe par default pour tous les nouveaux utilisateurs 
    $accountPassword = "AxePlaneUsers123+"

    
# Vérification de la présence de l'utilisateur dans l'AD
    if (Get-ADUser -Filter {SamAccountName -eq $samAccountName})
    {
        Write-Warning "L'identifiant $samAccountName existe déjà dans l'AD"
    }
    else
    {

    # Création des nouveaux utilisateurs à partir des variables définies dans la boucle Foreach
    New-ADUser -Name $name -DisplayName $name -GivenName $givenName -Surname $surname -SamAccountName $samAccountName -UserPrincipalName $userPrincipalName -EmailAddress $userPrincipalName -AccountPassword (ConvertTo-SecureString -AsPlainText $accountPassword -Force) -ChangePasswordAtLogon $true -Enable $true -Path "OU=$Service,DC=axeplane,DC=LOC" 

    # Intégration des membres dans leurs groupes de sécurité selon leur Fonction 
    Add-AdGroupMember -Identity $Fonction -Members $samAccountName

    # Création du dossier personnel des nouveaux utilisateurs
    New-Item -Name $samAccountName -Path ("E:\Partages personnels utilisateurs\") -ItemType Directory 

    # Partage du dossier personnel des nouveaux utilisateurs 
    New-SmbShare -Name ($samAccountName + "$") -Path ("E:\Partages personnels utilisateurs\" + $samAccountName) -ChangeAccess $samAccountName -FullAccess "Administrateurs"

        Write-Output "Utilisateurs de l'AD ainsi que leur date de création: "    
    }

}

# On affiche tous les utilisateurs de l'AD ainsi que leur date de création pour avoir un meilleur aperçu 
Get-ADUser  -Filter * `
            -Properties whenCreated | `
            Select-Object name,givenName,surname,userPrincipalName,whenCreated| Ft