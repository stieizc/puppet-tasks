# Install inputrc file
class config::inputrc {
  if $::environment == 'desktop' {
    $inputrc_file = '/etc/inputrc'
  }
  else {
    $user_name = hiera('user_name')
    $inputrc_file = "/home/${user_name}/.inputrc"
    file { $inputrc_file:
      ensure => present,
      owner  => $user_name,
      group  => $user_name,
    }
  }
  $inputrc_lines = ['"\e[A": history-search-backward',
                    '"\e[B": history-search-forward',
                    'set show-all-if-ambiguous on',
                    'set completion-ignore-case on'];
  $inputrc_lines.each |String $line| {
    file_line { $line:
      line => $line,
      path => $inputrc_file,
    }
  }
}
