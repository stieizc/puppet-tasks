# Setup developing environments
class develop {
  hiera_array('develop::langs', []).each |String $lang| {
    include "::develop::${lang}"
  }
}
