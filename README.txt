# Creation de l'environnement de travail

Installer git: https://git-scm.com/
Installer git-lfs: https://git-lfs.github.com/
Installer GitHub Desktop: https://desktop.github.com/

Initialiser git-lfs pour votre compte: git lfs install

Cloner ce repo à l'aide de GitHub Desktop
Ouvrir une console dans le dossier du clone et vérifier la configuration de git pour ce repo, comparer le résultat de cette commande avec ce qui suit : git config --list
'''
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
core.autocrlf=false
core.symlinks=false
pull.rebase=false
core.ignorecase=true
core.autocrlf=input
user.name=your_github_user_name
user.email=your_github_user_email@mail.com
'''

Regarder la liste des éléments ignorés par git dans le fichier .gitignore et ajouter ceux qui n'ont pas leur place dans git: fichiers générés, temporaires...

Regarder la liste des format suivis par git-lfs et ajouter les formats de ressource que vous souhaitez ajouter: les images, projets de logiciels, fichiers textes non comparables (xml, etc)

- less .gitattributes -> liste les formats actuellement gérés sous git-lfs
- git lfs track "*.file_ext" -> ajoute le format "*.file_ext" à cette liste
- git add .gitattributes
- git commit -m "Track .file_ext, ... files"

Si jamais des fichiers ont été pousser sur git alors que leur place est sous git-lfs, ce référer à cette page: https://github.com/git-lfs/git-lfs/wiki/Tutorial

# Git workflow

Une branche par fonctionnalité, commandes console:
- git checkout develop
- git pull -> mettre à jour develop (ou la branche depuis laquelle on souhaite bifurquer) à la dernière version
- git branch nom_de_branch_parlant
- git checkout nom_de_branch_parlant
- changements sur cette branches
- git add fichiers ajoutés, modifiés, déplacés, renommés, supprimés
- git commit -m "message de commit" -> https://www.conventionalcommits.org/en/v1.0.0/
- git push --set-upstream <remote> <branch> -> premier push de la branche car elle n'existe pas sur le remote
- git push -> si la branche existe à distance
- changements, commits, push...
- merge request sur github pour merger nom_de_branch_parlant dans develop (ou la branche de base)
- suppression de la branche

# Notes

Godot à un plugin git https://github.com/godotengine/godot-git-plugin/wiki

VSCode à un bon système de comparaison de fichiers

Kdiff3 permet de faire de la comparaison 3 fichiers, pratique.

