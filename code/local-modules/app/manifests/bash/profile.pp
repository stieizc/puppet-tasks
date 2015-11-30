# Install bash profile files
define app::bash::profile($user, $profile = $title, $kwargs = {}) {
  create_resources(file, { $profile => $kwargs }, {
    owner  => $user,
    group  => $user,
    mode   => 'u+x',
    })
}
