# Setup javascript developing for $::user_name
class develop::javascript {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  app::bash::profile { "${user_home}/.profile.d/npm.sh":
    user   => $user_name,
    kwargs => {
      source => 'puppet:///modules/develop/javascript/npm.sh',
    }
  }

  file { "${user_home}/.npmrc":
    ensure => present,
    source => 'puppet:///modules/develop/javascript/.npmrc',
    owner  => $user_name,
    group  => $user_name,
  }
}
