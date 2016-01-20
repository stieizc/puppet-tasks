if [ -f /etc/os-release ] && grep -q "debian" /etc/os-release
then
    alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
    complete -F _quilt_completion $_quilt_complete_opt dquilt
    alias mrepo="reprepro -b $LOCAL_REPO"
    complete -o filenames -F _reprepro mrepo
fi
