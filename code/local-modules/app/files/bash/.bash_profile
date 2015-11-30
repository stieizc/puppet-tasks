# .bash_profile

if [ -d ~/.profile.d ]
then
    for profile in ~/.profile.d/*.sh
    do
        [ -x $profile ] && . $profile
    done
fi

# Source .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
