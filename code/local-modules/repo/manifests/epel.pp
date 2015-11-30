# Enable EPEL repository
class repo::epel {
  if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora/ {
    package { 'epel-release':
      ensure => latest,
    }
  }
  else {
    notice { "${::operatingsystem} will not have the EPEL repository applied": }
  }
}
