# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::plugin::datainjection
class glpi::plugin::datainjection (
  $manage_prereqs = true,
  $version        = '2.7.0',
  $url            = "https://github.com/pluginsGLPI/datainjection/releases/download/${version}/glpi-datainjection-${version}.tar.bz2",
  $archive        = "datainjection-${version}.tar.bz2",
  $checksum       = '2935dd594c4370ca414731e883f3ca396ac7bd753582f847ae947a93ec7e4896',
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
    creates         => "${archive_dest}/datainjection/README.md",
    cleanup         => true,
    user            => $glpi::owner,
    group           => $glpi::group,
    require         => File[$glpi::archive_dest],
    }

}
