# Install bash files for $::user_name
class app::bash {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  ['.bashrc', '.bash_profile'].each |String $file| {
    file { "${user_home}/${file}":
      ensure => present,
      source => "puppet:///modules/app/bash/${file}",
      owner  => $user_name,
      group  => $user_name,
    }
  }

  ['.profile.d', '.bashrc.d'].each |String $dir| {
    file { "${user_home}/${dir}":
      ensure  => directory,
      recurse => remote,
      source  => "puppet:///modules/app/bash/${dir}",
      owner   => $user_name,
      group   => $user_name,
    } ->
    exec {"find ${user_home}/${dir} -type f -print | xargs chmod u+x":
      provider => shell,
    }
  }

  ['.local/bin', '.bash_profile.d'].each |String $dir| {
    file { "${user_home}/${dir}":
      ensure => directory,
      owner  => $user_name,
      group  => $user_name,
    }
  }
}