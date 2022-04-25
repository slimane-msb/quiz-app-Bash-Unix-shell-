#!/bin/sh




######### usage

usage ()
{
        printf "le script qcm pose un qcm a partir d'un ou pleusieur fichier aiken \nsyntax:./qcm aiken1 aiken2 ... \nou./qcm --h ou ./qcm -help pour l'aide\n"
}
      

case $1 in
                -h | --help )
                        usage
                        exit 0
                ;;
esac




note=0

echo 'combien de pays y en a ?'
echo 'A: 145'
echo 'B: 345'

read reponse


case $reponse in
        [aA])
                printf 'votre reponse %s\nbravo\n'$reponse
                note=$(($note+1))
                ;;
        [bB])
                printf 'votre reponse %s\nfaux\n'$reponse
                ;;
        *)
                echo 'reponse non reconnue!!\n'
                ;;
esac



echo 'combien de pays y en a ?'
echo 'A: 145'
echo 'B: 345'

read reponse


case $reponse in
        [aA])
                printf 'votre reponse %s\nbravo\n'$reponse
                note=$(($note+1))
                ;;
        [bB])
                printf 'votre reponse %s\nfaux\n'$reponse
                ;;
        *)
                echo 'reponse non reconnue!!\n'
                ;;
esac


printf 'votre score est %d/2\n' $note
