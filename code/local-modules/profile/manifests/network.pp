# Profile for network setup
class profile::network {
  include app::ssh
  include config::hosts
}
