# Setup python developing for $::user_name
class develop::python {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"


  app::bash::profile { "${user_home}/.profile.d/python.sh":
    user   => $user_name,
    kwargs => {
      source => 'puppet:///modules/develop/python/python.sh',
    }
  }

  app::bash::profile { "${user_home}/.bashrc.d/python.sh":
    user   => $user_name,
    kwargs => {
      source => 'puppet:///modules/develop/python/python-rc.sh',
    }
  }

  file { "${user_home}/.pythonrc":
    ensure => present,
    source => 'puppet:///modules/develop/python/.pythonrc',
    owner  => $user_name,
    group  => $user_name,
  }
}
