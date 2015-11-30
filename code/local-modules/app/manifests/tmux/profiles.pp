# Login scripts for tmux
class app::tmux::profiles {
  if $::environment == 'server' {
    $user_name = hiera('user_name')
    $user_home = "/home/${user_name}"

    ['start_tmux', 'stop_tmux'].each |$script| {
      app::bash::profile { "${user_home}/.local/bin/${script}":
        user   => $user_name,
        kwargs => {
          content => epp("app/tmux/${script}.epp"),
        }
      }
    }

    app::bash::profile { "${user_home}/.bash_profile.d/tmux.sh":
      user   => $user_name,
      kwargs => {
        source => 'puppet:///modules/app/tmux/tmux.sh',
      }
    }
  }
}
