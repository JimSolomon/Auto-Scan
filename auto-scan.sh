#!/bin/bash

if [ $# -eq 0 ];
  then
    echo " "
    echo "Type -h for more details"
    echo " "

elif [ "$1" == "-h" ] 
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
    echo "This scan will run threader3000, feroxbuster, crt.sh , ffuf and FinalRecon"
    echo "Usage: -m to specify which scan mode"
    echo "Aruguments (lower case): -m (for scan mode):  nmap, dir, crt , nikto, sub, thread and all "
    echo " "
    echo "Example usage: ./scan.sh -m crt twitter.com  smile.amazon.co.uk"
    echo " "
    exit 0
fi


source ./nmap.lib

getopts "m:" OPTION
MODE=$OPTARG
for i in "${@:$OPTIND:$#}"
do
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
            help
            sub_domain
            final_recon
          ;;
      esac
done

