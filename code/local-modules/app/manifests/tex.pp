# Install tex files for $::user_name
class app::tex {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  app::bash::profile { "${user_home}/.profile.d/tex.sh":
    source => 'puppet:///modules/app/tex/tex.sh',
    user   => $user_name,
  }
}
