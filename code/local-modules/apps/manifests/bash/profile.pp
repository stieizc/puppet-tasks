# Install bash profile files
define apps::bash::profile($source, $user, $profile = $title) {
  file { $profile:
    source => $source,
    owner  => $user,
    group  => $user,
    mode   => 'u+x',
  }
}
