<#

Auteur : Méghan Rigoli
Date : 14/08/2022
Version : 1.0
Description : Ce Script affiche les membres d'un groupe AD et réalise un export sous format .cvs
On propose une liste à choix des groupes AD à sélectionner pour afficher les membres.
L'export se réalise dans \DOCUMENTS\TEMP_MEMBRES_GROUPE\ et porte le nom de Membres_Groupe_le nom du groupe.cvs.

Sources : 
Pour la liste à choix : https://wiki-tech.io/Scripting/Powershell/Menu
Pour ADGroupMember : https://www.it-connect.fr/chapitres/recuperer-la-liste-des-membres-dun-groupe-ad/

#>

# On commence la boucle While avec la liste des groupes et on demande de faire un choix ou appuyer sur "X" pour quitter
$continue = $true
while ($continue){
  write-host “Sélectionner les membres du groupe AD à afficher et exporter”
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
  write-host "------------------------X pour Quitter----------------------"
  $choix = read-host “faire un choix :”

  # Suite au choix effectué, un export est réalisé ainsi que l'affichage des membres du groupe.
  # Continuer à faire des choix ou appuyer sur "X" pour quitter la boucle. 

  switch ($choix){
    1{Get-ADGroupMember -Identity "Directeur général" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Directeur_général.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Directeur général" | Format-Table Name}
    2{Get-ADGroupMember -Identity "Directeur adjoint" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Directeur_adjoint.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Directeur adjoint" | Format-Table Name}
    3{Get-ADGroupMember -Identity "Secrétaire de direction" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Secrétaire_de_direction.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Secrétaire de direction" | Format-Table Name}
    4{Get-ADGroupMember -Identity "Directrice des Ressources Humaines" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Directrice_des_Ressources_Humaines.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Directrice des Ressources Humaines" | Format-Table Name}
    5{Get-ADGroupMember -Identity "Assistants RH" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Assistants_RH.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Assistants RH" | Format-Table Name}
    6{Get-ADGroupMember -Identity "Responsable service Financet" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Responsable_service_Finance.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Responsable service Finance" | Format-Table Name}
    7{Get-ADGroupMember -Identity "Gestionnaire finances comptabilité" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Gestionnaire_finances_comptabilité.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Gestionnaire finances comptabilité" | Format-Table Name}
    8{Get-ADGroupMember -Identity "Assistante comptable" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Assistante_comptable.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Assistante comptable" | Format-Table Name}
    9{Get-ADGroupMember -Identity "Responsable service Commercial" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Responsable_service_Commercial.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Responsable service Commercial" | Format-Table Name}
    10{Get-ADGroupMember -Identity "Commercial" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Commercial.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Commercial" | Format-Table Name}
    11{Get-ADGroupMember -Identity "Responsable service Logistique" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Responsable_service_Logistique.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Responsable service Logistique" | Format-Table Name}
    12{Get-ADGroupMember -Identity "Opérateur logistique" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Opérateur_logistique.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Opérateur logistique" | Format-Table Name}
    13{Get-ADGroupMember -Identity "DResponsable service Marketing" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Responsable_service_Marketing.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Responsable service Marketing" | Format-Table Name}
    14{Get-ADGroupMember -Identity "Assistant marketing" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Assistant_marketingt.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Assistant marketing" | Format-Table Name}
    15{Get-ADGroupMember -Identity "Stagiaire service Marketing" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Stagiaire_service_Marketing.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Stagiaire service Marketing" | Format-Table Name}
    16{Get-ADGroupMember -Identity "Responsable service Informatique" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Responsable_service_Informatique.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Responsable service Informatique" | Format-Table Name}
    17{Get-ADGroupMember -Identity "Administrateur Systèmes et Réseaux" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Administrateur_Systèmes_et_Réseaux.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Administrateur Systèmes et Réseaux" | Format-Table Name}
    18{Get-ADGroupMember -Identity "Technicien Supérieur Systèmes et Réseaux" -Recursive | select name | Export-CSV C:\Users\Administrateur\Documents\TEMP_MEMBRES_GROUPE\Membres_Groupe_Technicien_Supérieur_Systèmes_et_Réseaux.csv -NoTypeInformation
    Get-ADGroupMember -Identity "Technicien Supérieur Systèmes et Réseaux" | Format-Table Name}
    ‘x’ {$continue = $false}
    default {Write-Host "Choix invalide"-ForegroundColor Red}
  }
}
