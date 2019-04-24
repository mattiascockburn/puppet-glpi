# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi
class glpi(
  Boolean $manage_repos,
  Boolean $manage_packages,
  Boolean $manage_php,
  Array[String] $packages,
  String $php_version,
  Hash $php_settings,
  String $owner,
  String $group,
  String $basedir,
  String $sha1sum,
  String $archive_name,
  String $archive_dest,
  String $url
) {
  if $manage_repos {
    contain glpi::repos
  }
  contain glpi::install
}
