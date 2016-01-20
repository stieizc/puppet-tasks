# Profile for shell setup
class profile::shell {
  include app::bash
  include app::tmux
  include app::ranger
  include config::inputrc
}
