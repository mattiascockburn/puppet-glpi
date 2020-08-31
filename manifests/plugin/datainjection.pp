# Install the datainjection plugin
#
# @summary Install the datainjection plugin
#
# @example
#   include glpi::plugin::datainjection
class glpi::plugin::datainjection (
  $manage_prereqs = true,
  $version        = '2.8.0',
  $url            = "https://github.com/pluginsGLPI/datainjection/releases/download/${version}/glpi-datainjection-${version}.tar.bz2",
  $archive        = "datainjection-${version}.tar.bz2",
  $checksum       = 'f6d7365024328b50b8afe2833e87aaeccc518a718278e8b277e89cad124a2784',
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
