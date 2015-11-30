# Install bash profile files
define app::bash::profile($source, $user, $profile = $title) {
  file { $profile:
    source => $source,
    owner  => $user,
    group  => $user,
    mode   => 'u+x',
  }
}
