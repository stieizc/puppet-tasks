# Ranger setup for $user_name
class app::ranger {
  $user_name = hiera('user_name')
  $local_dir = "/home/${user_name}/.local"
  $ranger_dir = "${local_dir}/ranger"

  if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora/ {
    vcsrepo { $ranger_dir:
      ensure   => present,
      provider => git,
      source   => 'https://github.com/hut/ranger.git',
      depth    => 1,
    }
    ->
    file { "${local_dir}/bin/ranger":
      ensure => link,
      target => "${ranger_dir}/ranger.py"
    }
  }
  else {
    package { 'ranger':
      ensure => latest,
    }
  }
}
