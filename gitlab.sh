if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi


read -n1 -p "RHEL Version: [6 or 7]" doit 
case $doit in  
  6) ./gitlab/rhel6.sh;; 
  7) ./gitlab/rhel7.sh ;; 
  *) echo dont know ;; 
esac
