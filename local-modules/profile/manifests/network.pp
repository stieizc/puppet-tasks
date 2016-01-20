# Profile for network setup
class profile::network {
  include app::ssh
  if $::environment == 'desktop' {
    include config::hosts
  }
}
