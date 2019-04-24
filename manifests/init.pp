# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi
class glpi(
  Boolean $manage_database,
  Boolean $manage_repos,
) {
  if $manage_repos {
    contain glpi::repos
  }
  contain glpi::install
}
