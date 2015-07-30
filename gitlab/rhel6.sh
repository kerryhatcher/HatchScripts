printf "\n\n Instaling GiitLab on RHEL 6\n\n"


if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

#based on info from: https://about.gitlab.com/downloads/

#Prerequisites:
yum install curl openssh-server postfix cronie
service postfix start
chkconfig postfix on
lokkit -s http -s ssh


#Add GitLab Repo:
./gitlab.rpm.sh


#Install gitlab:
yum install gitlab-ce

#Configure and start:
gitlab-ctl reconfigure



#Custom stuff

finish_message ()
{

  host=`hostname -f 2>/dev/null`
  if [ "$host" = "" ]; then
    host=`hostname 2>/dev/null`
    if [ "$host" = "" ]; then
      host=$HOSTNAME
    fi
  fi

  if [ "$host" = "" ]; then
    echo "Unable to determine the hostname of your system!"
    echo
    echo "Please consult the documentation for your system. The files you need "
    echo "to modify to do this vary between Linux distribution and version."
    echo
    exit 1
  fi

  fqn=$(host -TtA $(hostname -s)|grep "has address"|awk '{print $1}') ; \
  if [[ "${fqn}" == "" ]] ; then fqn=$(hostname -s) ; fi ; \
  echo "${fqn}"



  printf "\n\n\n\n============ \n\nPlease visit http://${fqn} to use gitlab \n\n"

  printf "Don't forget to chage /etc/gitlab/gitlab.rb to suite your needs\n\n"

  printf "Check out https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/files/gitlab-config-template/gitlab.rb.template for a baseline \n\n"

  printf "you will need to run sudo gitlab-ctl reconfigure one more time after you make your changes to /etc/gitlab/gitlab.rb\n\n============ \n\n\n\n\n\n"
}


finish_message 
