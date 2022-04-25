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

#on decoupe les fichiers aiken en fichier par question dans le rep qcm_temp
if [ -e qcm_temp ];then
    rm -r qcm_temp
fi
 

rand; num_ran=$RAND
mkdir qcm_temp



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



if [ -e fichier_temp ] ;then
    rm fichier_temp
fi

for arg in qcm_temp/*
do 
    cat $arg >>fichier_temp
done

rm -r qcm_temp
    
    
    
#poser le qcm a partir du fichier fichire_temp
# il faut repondre avec une lettre majuscule comme dans le fichier aiken
    
note=0
n_question=0


while  IFS= read -r line <&3 
do 
    if [ $n_question -lt 20 ] ;then
        case $line in
            ANSWER*)
                n_question=$(($n_question+1))
                IFS= read -r reponse
                case "$line" in
                    *"ANSWER: $reponse"*)
                        echo bravo
                        printf 'votre reponse est:%s\n' $reponse
                        note=$(($note+1))
                        ;;
                    *)
                        echo "faux"
                        ;;
                esac 

                ;;
            *)
                printf '%s\n' "$line"
                ;;
        esac
    fi
done 3<fichier_temp



printf 'votre score est %d/%d\n' $note $n_question
 

rm fichier_temp
                

              
         
