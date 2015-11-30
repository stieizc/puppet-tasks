# Setup java developing for $::user_name
class develop::java {
  $user_name = hiera('user_name')
  $user_home = "/home/${user_name}"

  app::bash::profile { "${user_home}/.profile.d/java.sh":
    user   => $user_name,
    kwargs => {
      source => 'puppet:///modules/develop/java/java.sh',
    }
  }
}
