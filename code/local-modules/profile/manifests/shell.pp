# Profile for shell setup
class profile::shell {
  include app::bash
  include app::tmux
  include app::ranger
  include app::emacs
  include config::inputrc
}
