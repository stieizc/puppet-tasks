if [ -f /etc/os-release ] && grep -q "debian" /etc/os-release
then
    DEBEMAIL="stieizc.33@gmail.com"
    DEBFULLNAME="Charlie Brown"
    export DEBEMAIL DEBFULLNAME
    export LOCAL_REPO="/var/local/myrepo"
fi
