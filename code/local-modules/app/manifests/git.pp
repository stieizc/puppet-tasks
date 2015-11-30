# Git setup for $user_name
class app::git {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  file { "${user_home}/.gitconfig":
    ensure => present,
    source => 'puppet:///modules/app/git/.gitconfig',
    owner  => $user_name,
    group  => $user_name,
  }
}
