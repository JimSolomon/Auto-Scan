#!/bin/bash




if [ $# -eq 0 ];
    then
    echo " "
    echo "Type -h for more details"
    echo " "

elif [ "$1" == "-h" ]; 
    then
    # Display Help
    echo "  "
    echo "  █████╗ ██╗   ██╗████████╗ ██████╗     ███████╗ ██████╗ █████╗ ███╗   ██╗"    
    echo " ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗    ██╔════╝██╔════╝██╔══██╗████╗  ██║"    
    echo " ███████║██║   ██║   ██║   ██║   ██║    ███████╗██║     ███████║██╔██╗ ██║"    
    echo " ██╔══██║██║   ██║   ██║   ██║   ██║    ╚════██║██║     ██╔══██║██║╚██╗██║"    
    echo " ██║  ██║╚██████╔╝   ██║   ╚██████╔╝    ███████║╚██████╗██║  ██║██║ ╚████║"  
    echo "                                                                          "
    echo "This a RECON tool created by Jim Solomon"
    echo " "
    echo "This scan will run threader3000(thread), feroxbuster(dir), crt.sh(crt), ffuf(sub), whois(who), nikto(nikto), dig(dig) and FinalRecon(final)"
    echo "Usage: -m to specify which scan mode"
    echo "Aruguments (lower case): -m (for scan mode): dir, crt, nikto, sub, thread, who, dig, final and all "
    echo " "
    echo "Example usage: ./scan.sh -m crt twitter.com smile.amazon.co.uk"
    echo " "
    exit 0

elif [ "$2" == "" ];
    then 
    echo " "
    echo "Please specify a scan mode after -m: dir, crt , nikto, sub, thread, fiinal, all"
    echo " "

elif [ "$3" == "" ]
    then 
    echo " "
    echo "Please specify one or more domains. Example: google.com"
    echo " "

fi

source ./nmap.lib
#modee="dir crt nikto sub thread who dig final all"
getopts "m:" OPTION
MODE=$OPTARG

while true;do
    if [ "$2" != "dir" ] && [ "$2" != "crt" ] && [ "$2" != "nikto" ] && [ "$2" != "sub" ] && [ "$2" != "thread" ] && [ "$2" != "who" ] && [ "$2" != "dig" ] && [ "$2" != "final" ] && [ "$2" != "all" ]; then

        echo "You have entered a wrong mode $2. Please specify a scan mode: dir, crt, nikto, sub, thread, who, fiinal, all"
        break
    else
        for i in "${@:$OPTIND:$#}";do    
            url=$i
            case $MODE in 
                thread)
                    thread_3000
                    ;;
                dir)
                    dir_bf
                    ;;
                crt)
                    crt_scan
                    ;;
                sub)
                    sub_domain
                    ;;
                nikto)
                    nikto_scan
                    ;;
                who)
                    who
                    ;;
                final)
                    final_recon
                    ;;
                dig)
                    dig
                    ;;
                all)
                    dig
                    thread_3000
                    dir_bf
                    crt_scan
                    sub_domain
                    who
                    nikto_scan
                    final_recon
                    ;;
                *)
                dig
                who
                thread_3000
                dir_bf
                nikto_scan
                crt_scan
                sub_domain
                final_recon
                ;;
            esac
        done
    break
    fi
done
