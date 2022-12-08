# Projets-OCR
Plusieurs scripts Powershell produits dans le cadre de ma formation OpenClassrooms. 
Ces scripts sont adaptés pour un environnement sous Windows Server avec un Active Directory.

SCRIPT_CREATION_UTILISATEUR_EN_MASSE.ps1 : Ce script permet de créer des utilisateurs en masse dans l'AD à partir d'un fichier en format .cvs. 
Un dossier personnel caché portant le nom de chaque utilisateur est créé et partagé via SMB.

CREATION-UTILISATEUR-AD.ps1 : Ce script permet de créer un utilisateur dans l'AD ainsi que son dossier de partage personnel.

EXPORT GROUPES.ps1 : Ce script permet d'afficher les groupes d'un membre AD en entrant le Login de l'utilisateur et réalise un export de celui-ci dans \Documents\TEMP_GROUPES_MEMBRE\ au format .cvs.

EXPORT MEMBRES.ps1 : Ce Script affiche les membres d'un groupe AD et réalise un export sous format .cvs
On propose une liste à choix des groupes AD à sélectionner pour afficher les membres.
L'export se réalise dans \DOCUMENTS\TEMP_MEMBRES_GROUPE\ et porte le nom de Membres_Groupe_le nom du groupe.cvs.

SAUVEGARDE_GPO.ps1 : Ce script permet de sauvegarder le C:\Users de chaque utilisateur, dossiers Bureau, Documents et Téléchargements sur le serveur dans le dossier E:\Sauvegardes\Users. Il s'execute grâce à une GPO / Tâche programée.

Sauvegarde.ps1 : Ce script permet de sauvegarder le C:\Users de chaque utilisateur s'étant déjà connecté à l'ordinateur. 
Les dossiers Bureau, Documents et Téléchargements sont copiés sur le serveur dans le dossier E:\Sauvegardes\Users.

WindowstyleHidden.ps1 : Ce script permet de cacher et executer un autre script.

CREATION_DOSSIER_EN_MASSE.ps1 : Ce script permet de créer et nommer des dossiers en masse issu d'un fichier "structure.txt".
