# Setup keyboard config
class config::keyboard {
  if $::osfamily == 'RedHat' {
    $keyboard_config = '/etc/sysconfig/keyboard'
  }
  #else if $::osfamily == 'Debian' {
  else {
    $keyboard_config = '/etc/default/keyboard'
  }

  $keymaps_dir = '/usr/local/share/keymaps'

  file_line { 'KMAP':
    ensure => present,
    path   => $keyboard_config,
    line   => "KMAP='${keymaps_dir}/swapped.kmap.gz'",
    match  => '^[\s]*KMAP',
  }

  file { $keymaps_dir:
    ensure => directory,
  }

  file { "${keymaps_dir}/swapped.kmap.gz":
    ensure => present,
    source => 'puppet:///modules/config/swapped.kmap.gz',
  }
}
