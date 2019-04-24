# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::install
class glpi::install (
  $manage_packages,
  $manage_php,
  $packages,
  $php_version,
) {
  class { '::php::globals':
    php_version => $php_version,
    rhscl_mode  => 'rhscl',
  }
  -> class { '::php':
    manage_repos => false
  }
  $packages.each |$pkg| {
    ensure_packages($packages)
  }
}
