
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






note=0
n_question=0

for arg 
do
    while IFS= read -r line <&3
    do 
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
    done 3<$arg
    
done


printf 'votre score est %d/%d\n' $note $n_question
 
 
                
