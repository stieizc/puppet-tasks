# Setup X for $user_name
class app::x {
  require ::config::keyboard
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  file { "${user_home}/.xsessionrc":
    ensure => present,
    source => 'puppet:///modules/app/X/.xsessionrc',
    owner  => $user_name,
    group  => $user_name,
  }

  file { "${::config::keyboard::keymaps_dir}/load_xmodmaprc":
    ensure => present,
    source => 'puppet:///modules/app/X/load_xmodmaprc',
    mode   => 'a+x',
  }

  file { "${::config::keyboard::keymaps_dir}/xmodmaprc":
    ensure => present,
    source => 'puppet:///modules/app/X/xmodmaprc',
  }

  file { "${user_home}/.xmodmaprc":
    ensure => present,
    source => 'puppet:///modules/app/X/xmodmaprc',
    owner  => $user_name,
    group  => $user_name,
  }
}
