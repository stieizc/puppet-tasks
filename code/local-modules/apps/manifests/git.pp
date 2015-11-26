# Git setup for $user_name
class apps::git {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  file { "${user_home}/.gitconfig":
    ensure => present,
    source => 'puppet:///modules/apps/git/.gitconfig',
    owner  => $user_name,
    group  => $user_name,
  }
}
