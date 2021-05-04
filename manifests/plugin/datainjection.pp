# Install the datainjection plugin
#
# @summary Install the datainjection plugin
#
# @example
#   include glpi::plugin::datainjection
class glpi::plugin::datainjection (
  $manage_prereqs = true,
  $version        = '2.9.0',
  $url            = "https://github.com/pluginsGLPI/datainjection/releases/download/${version}/glpi-datainjection-${version}.tar.bz2",
  $archive        = "datainjection-${version}.tar.bz2",
  $checksum       = '901a5b3361d920300ab8c413dcf3394f6b822da2a2f0244445f80c66e16f9528',
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
