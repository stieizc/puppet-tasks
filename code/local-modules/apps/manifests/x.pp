# Setup X for $user_name
class apps::x {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  file { "${user_home}/.xsessionrc":
    ensure => present,
    source => 'puppet:///modules/apps/X/.xsessionrc',
    owner  => $user_name,
    group  => $user_name
  }
}
