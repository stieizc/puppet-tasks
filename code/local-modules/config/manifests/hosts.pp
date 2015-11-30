# Install hosts file
class config::hosts {
  file { '/etc/hosts':
    ensure => present,
    source => 'puppet:///modules/config/hosts',
  }
}
