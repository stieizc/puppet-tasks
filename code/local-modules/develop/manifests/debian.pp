# Setup debian developing for $::user_name
class develop::debian {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  app::bash::profile { "${user_home}/.profile.d/debian.sh":
    source => 'puppet:///modules/develop/debian/debian.sh',
    user   => $user_name,
  }

  app::bash::profile { "${user_home}/.bashrc.d/debian.sh":
    source => 'puppet:///modules/develop/debian/debian-rc.sh',
    user   => $user_name,
  }
}
