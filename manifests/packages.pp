# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::packages
class glpi::packages (
  $packages,
) {
  package{$packages:
    ensure => present,
  }
}
