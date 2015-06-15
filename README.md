Lancer les cmd en mode admin 

# MeanIO-vagrant
Box for mean.io application on vagrant

#Installation
Tout d'abord, il faut éditer la valeur de la clé "source" sous synced_folder/vflsf_0wkbiuwyr001 dans le fichier puphpet/config.yaml . Il faut lui donner le chemin d'accès où le git est stocké. 

#Activation du support des symlink
* Run the Local Security Policy (Win+R, type "secpol.msc", confirm UAC). Then navigate to "Local Policies->User Rights Assignment".
* Find the permission called "Create symbolic links" and double-click it. Add your user to the list of objects having this permission. Or you can add the "Users" group. 
* Log off and log on. 
* You can check the success by running in console: "whoami /priv". If you see the privilege SeCreateSymbolicLinkPrivilege enabled, you've done well.

Après, il faut se rentre dans le dossier "C:\Program Files\Oracle\VirtualBox" et lancer une cmd. Puis éxecuter les deux commandes suivantes qui permettront d'activer la gestion des symlink : 

* VBoxManage setextradata VM_NAME VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant 1
* VBoxManage setextradata VM_NAME VBoxInternal2/SharedFoldersEnableSymlinksCreate/vflsf_0wkbiuwyr001 1

# Activation du support long path windows
Une fois que c'est fait, si la version de vagrant <= 1.7.2, il faut éditer le fichier "C:\HashiCorp\Vagrant\embedded\gems\gems\vagrant-1.7.1\plugins\providers\virtualbox\driver\version_4_3.rb" et remplacer la ligne 500 : 

-       folder[:hostpath]]
+      '\\\\?\\' + folder[:hostpath].gsub(/[\/\\]/,'\\')]

# Démarrage de la box
Puis lancer vagrant en se positionnant dans le dossier où la box est. (Vagrant up), une fois démarré, se connecter en ssh, se posionner dans /var/www/faismavaissellefdp/FaisMaVaisselleFDP et lancer un "node install". 

L'install devrais être OK. Lancer un "gulp". Une fois que le guld est lancé (attendre 1-2 min, un grand nombre de message de log doivent s'afficher), direction le fichier host de windows, rentrer "192.168.56.101 faismavaissellefdp.dev", enregistrer. ouvrir un navigateur, taper faismavaissellefdp.dev et normalement tout est ok :) ! 
