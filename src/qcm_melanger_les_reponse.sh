#!/bin/sh


######### usage

usage ()
{
        printf "\n\nhelp:\nle script qcm pose un qcm a partir d'un ou pleusieur fichier aiken \nsyntax:./qcm aiken1 aiken2 ... \nou./qcm --h ou ./qcm -help pour l'aide\n\n\n"
}
      

case $1 in
    -h | --help )
            usage
            exit 0
    ;;
esac


if [ $# -lt 1 ]     ;then

        usage
        printf "nombre d'argument inf a 1 et le premier n'est pas --help ou -h\n\n\n"
        exit 2

fi





# Initialise le générateur de nombres aléatoires (à appeler une seule fois).

srand()
{
    # nombre de secondes depuis le 1er janvier 1970 00:00
    __ETAT=$(awk 'BEGIN { srand(); print srand() }')
}

RAND_MAX=0x100000
# met dans la variable RAND un entier aléatoire entre 0 et RAND_MAX (exclu)

rand()
{
    # générateur congruentiel utilisé par rand() dans glibc d'après
    # wikipedia
    __ETAT=$(((1664525 * $__ETAT + 1013904223) % 0x10000000))
    RAND=$(($__ETAT % $RAND_MAX))
}

srand; 

#lire les questions dans un ordre melange
afficher_question ()
{
    #on suppose que la fonction shuf est installe
    shuf fichier_question_temp
    supprimer_fichier_ou_rep_existant fichier_question_temp
    printf '\n'
}

#supprimer un fichier ou un rep si il exist
supprimer_fichier_ou_rep_existant ()
{
    if [ -e $1 ];then
    rm -r $1
    fi
}

#on decoupe les fichiers aiken en fichier par question dans le rep qcm_temp
supprimer_fichier_ou_rep_existant qcm_temp
 

rand; num_ran=$RAND
mkdir qcm_temp


#copier chaque question a un fichier nomme avec un numero aleatoire 
for arg 
do
    while IFS= read -r line
    do 
        case $line in
            ANSWER*)
                printf '%s\n\n' "$line" >>qcm_temp/"$num_ran"
                rand; num_ran=$RAND
                ;;

            *)
                printf '%s\n' "$line" >>qcm_temp/"$num_ran"
                ;;
        esac
    done <$arg
    
done


#pour eviter vider le fichier si il existait deja " en le supprimant" 
supprimer_fichier_ou_rep_existant fichier_temp

#copier toutes les question a partir des fichier question temp a un seul fichier temp
for arg in qcm_temp/*
do 
    cat $arg >>fichier_temp
done


supprimer_fichier_ou_rep_existant qcm_temp
    
    
    
#poser le qcm a partir du fichier fichire_temp
    
note=0
n_question=0


while  IFS= read -r line <&3 
do 
    if [ $n_question -lt 20 ] ;then
        case $line in
            ANSWER*)
                n_question=$(($n_question+1))
                #afficher les reponse possible a partir du fichier fichier_question_temp
                afficher_question
                IFS= read -r reponse
                case "$line" in
                    *"ANSWER: $reponse"*)
                        printf 'votre reponse est:%s\nbravo\n\n' $reponse
                        note=$(($note+1))
                        ;;
                    *)
                        printf "votre reponse: %s\npas juste \n\n" $reponse
                        ;;
                esac 

                ;;
            *"?"*)
                printf '%s\n' "$line"
                ;;
            #pour ne pas afficher des lignes vides entre les reponse proposes
            [!a-zA-Z])
                ;;
            #copier les reponse a un fichier question temp puis l'afficher et attendre la reponse dans le cas : *ANSWER*
            *)
                printf '%s\n' "$line" >>"fichier_question_temp"
                ;;
        esac
    fi
done 3<fichier_temp



printf 'votre score est %d/%d\n' $note $n_question
 

supprimer_fichier_ou_rep_existant fichier_temp
supprimer_fichier_ou_rep_existant fichier_question_temp


