# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::plugin::fields
class glpi::plugin::fields (
  $manage_prereqs = true,
  $version        = '1.10.2',
  $url            = "https://github.com/pluginsGLPI/fields/releases/download/${version}/glpi-fields-${version}.tar.bz2",
  $archive        = "fields-${version}.tar.bz2",
  $checksum       = '2c4887e31d839e3e3ef378ab31a03cb962b37d809ad45b78ffcc3a084e86da77',
  $checksum_type  = 'sha256',
  $archive_dest   = "${glpi::archive_dest}/plugins/",
){
  if $manage_prereqs {
    ensure_packages('bzip2')
  }
  archive { $archive:
    path            => "/var/tmp/${archive}",
    source          => $url,
    checksum        => $checksum,
    checksum_type   => $checksum_type,
    extract         => true,
    extract_path    => $archive_dest,
    creates         => "${archive_dest}/fields/README.md",
    cleanup         => true,
    user            => $glpi::owner,
    group           => $glpi::group,
    require         => File[$glpi::archive_dest],
    }

}
