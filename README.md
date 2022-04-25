# quiz-app-Bash-Unix-shell-
create a quiz with bash 

# <center>  Compte rendu </center>
# 1. Présentation générale :
  
a. Fonctionnalité principale :
Ce projet contient différent version (basic, avec fichier Aiken, mélanger les questions,
et en fin mélanger les réponse), et chaque script est un qcm qui pose des questions à
l’utilisateur, lit la réponse, puis afficher c’est la réponse est vrai ou fausse. A la fin de 
l’exécution, un score sera affiché.
  
c. TODO :
L’affichage est basic, sans couleur, mais le qcm est posé d’une manière claire, et 
l’idée utilisé dans ce script pour mélanger les questions et les réponses est de créer des 
fichiers temporaires 
# 2. Arguments et options :
  
a. Le ficher qcm et a exécuter de cette manière :
. /qcm fichier_aiken1 fichier_aiken2 …
ou fichier_aiken1 et 2 .. Sont des fichier Aiken qui contient le qcm a poser
  
b. Il faut entrer au moins un argument pour le fichier Aiken pour pouvoir faire le qcm
  
c. On suppose que la fonctionne Shuf est installer pour ce projet 
# 3. Fonctionnalités accessibles après le lancement du script :
 
a. Les réponses doivent être entrer exactement comme ils sont écrites sur le fichier 
Aiken ‘dans ce cas-là en majuscule ‘
 
b. En cas d’entrer erroné le programme considère la réponse est fausse 
# 4. Description des fonctions :
 
a. srand() : initialise le générateur de nombres aléatoires (à appeler une seule fois).
 
b. Afficher_question : lire les questions dans un ordre mélange
 
c. Supprimer_un_fichier_ou_rep_existant : supprimer un fichier ou un rep s’il existe
# 5. Environnement :
 
a. Test : les scripts ont été testé sur Dash
 
b. System d’exploitation : GNU/Linux avec distribution Debian
 
c. Editeur de texte : Kate 
# 6. Bugs et TODO :
 
a. Bugs : comment mélanger les réponses
 
b. Solution : utilisation de la méthode introduite lors du mélange des questions, en créant
des fichiers temporaires
 
c. TODO:
 
a. Comprendre le problème
 
b. Citer toutes les idées possibles sur un block note 
 
c. Commencer avec la version basic 

d. Editer la version basic pour pouvoir lire a partir des fichiers Aiken

e. Utiliser la méthode des fichiers temporaire pour mélanger les questions 

f. S’inspire de la méthode 1 pour pouvoir mélanger les réponses

g. Ecrire la fonctionne usage et étudier l’état du program en cas d’erreur 

h. Ajouter des commentaires 

i. Tester le code et corriger les erreurs 

# 7.  remerciements :
 
Je tiens à remercier mes deux professeurs (du cours et du TP), pour le 
soutien qu’ils m’ont apporté dans la réalisation du projet, par toutes les explications, et 
les idées cites dans les consignes.
