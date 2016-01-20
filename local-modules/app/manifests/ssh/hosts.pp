# Copy ssh hosts files
class app::ssh::hosts {
  if $::environment == 'desktop' {
    $user_name = hiera('user_name')
    $user_home = "/home/${user_name}"

    ['ssh.hosts', 'mosh.hosts'].each |String $host_file| {
      file { "${user_home}/.ssh/${host_file}":
        ensure => present,
        source => "puppet:///modules/app/ssh/${host_file}",
        owner  => $user_name,
        group  => $user_name,
      }
    }
  }
}
