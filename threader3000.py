#!/usr/bin/python3

#https://github.com/dievus/threader3000 script adopted from here and modified by Jim Solomon


import socket
import os
import signal
import time
import threading
import sys
import subprocess
from queue import Queue
from datetime import datetime

# Start Threader3000 with clear terminal
# subprocess.call('clear', shell=True)

# Main Function
def main():
    socket.setdefaulttimeout(0.30)
    print_lock = threading.Lock()
    discovered_ports = []


    target = sys.argv[1]
    error = ("Invalid Input")
    try:
        t_ip = socket.gethostbyname(target)
    except (UnboundLocalError, socket.gaierror):
        print("\n[-]Invalid format. Please use a correct IP or web address[-]\n")
        sys.exit()
    #Banner
    print("-" * 60)
    print("Scanning target "+ t_ip)
    print("Time started: "+ str(datetime.now()))
    print("-" * 60)
    t1 = datetime.now()

    def portscan(port):

       s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
       
       try:
          portx = s.connect((t_ip, port))
          with print_lock:
             print("Port {} is open".format(port))
             discovered_ports.append(str(port))
          portx.close()

       except (ConnectionRefusedError, AttributeError, OSError):
          pass

    def threader():
       while True:
          worker = q.get()
          portscan(worker)
          q.task_done()
      
    q = Queue()
     
    #startTime = time.time()
     
    for x in range(200):
       t = threading.Thread(target = threader)
       t.daemon = True
       t.start()
    #scan all 65535 TCP ports 
    for worker in range(1, 65535):
       q.put(worker)

    q.join()

    t2 = datetime.now()
    total = t2 - t1
    print("Port scan completed in "+str(total))
    print("-" * 60)
    print("Threader3000 recommends the following Nmap scan:")
    print("*" * 60)
    print("nmap -p{ports} -sV -sC -T4 -Pn -v {ip}".format(ports=",".join(discovered_ports), ip=target))
    print("*" * 60)
    nmap = "nmap -p{ports} -sV -sC -T4 -Pn -v {ip}".format(ports=",".join(discovered_ports), ip=target)
    t3 = datetime.now()
    total1 = t3 - t1

#Nmap Integration (in progress)

    def automate():
      try:
         os.system(nmap)
         #convert = "xsltproc "+target+".xml -o "+target+".html"
         #os.system(convert)
         t3 = datetime.now()
         total1 = t3 - t1
         print("-" * 60)
         print("Combined scan completed in "+str(total1))
         print("Press enter to quit...")
      except FileExistsError as e:
         print(e)
         exit()
               
    automate()

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\nGoodbye!")
        quit()