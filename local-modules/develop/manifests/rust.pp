# Setup rust developing for $::user_name
class develop::rust {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  app::bash::profile { "${user_home}/.profile.d/rust.sh":
    user   => $user_name,
    kwargs => {
      source => 'puppet:///modules/develop/rust/rust.sh',
    }
  }
}
