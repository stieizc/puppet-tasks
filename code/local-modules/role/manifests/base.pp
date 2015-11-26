# Base Role for nearly every environment
class role::base {
  include profile::shell
  include profile::version_control
  include profile::develop
}
