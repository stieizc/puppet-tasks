# Install tex files for $::user_name
class apps::tex {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  apps::bash::profile { "${user_home}/.profile.d/tex.sh":
    source => 'puppet:///modules/apps/tex/tex.sh',
    user   => $user_name,
  }
}
