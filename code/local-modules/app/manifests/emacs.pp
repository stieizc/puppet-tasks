# Emacs setup
class app::emacs {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"
  package { 'emacs': }
  ->
  vcsrepo { "${user_home}/.emacs.d":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/syl20bnr/spacemacs',
    user     => $user_name,
  }
  ->
  vcsrepo { "${user_home}/.spacemacs.d":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/stieizc/.spacemacs.d',
    user     => $user_name,
  }
  ->
  app::bash::profile { "${user_home}/.profile.d/emacs.sh":
    user   => $user_name,
    kwargs => {
      source => 'puppet:///modules/app/emacs/emacs.sh',
    },
  }
}
