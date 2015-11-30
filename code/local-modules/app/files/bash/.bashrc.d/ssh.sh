sadd() {
    if ! ssh-add -l | grep -q $1
    then
        ssh-add $1
    fi
}

scp() {
    sadd ~/.ssh/stieizc_android
    $(which scp) $@
}

ssh_login() {
    sadd ~/.ssh/stieizc_android
    ssh -A -i ~/.ssh/stieizc_android $@
    #ssh -A -i ~/.ssh/stieizc_android -R ~/.gnupg/S.gpg-agent:~/.gnupg/S.remote-agent -o "StreamLocalBindUnlink=yes" ${@/gpg/}
}

mosh_login() {
    sadd ~/.ssh/stieizc_android
    ssh_cmd="ssh -A -i ~/.ssh/stieizc_android ${@:1:$#-1}"
    mosh --ssh="$ssh_cmd" ${!#}
}

for method in ssh mosh; do
    hosts=~/.ssh/${method}.hosts
    if [ -r $hosts ]; then
        while read line; do
            name=$(cut -d " " -f1 <<< $line)
            ssh_args=$(cut -d " " -f2- <<< $line)
            eval "$name() {
${method}_login $ssh_args
}"
        done < $hosts
    fi
    unset hosts
done
