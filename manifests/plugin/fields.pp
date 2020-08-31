# Install the field plugin
#
# @summary Install the field plugin
#
# @example
#   include glpi::plugin::fields
class glpi::plugin::fields (
  $manage_prereqs = true,
  $version        = '1.11.0',
  $url            = "https://github.com/pluginsGLPI/fields/releases/download/${version}/glpi-fields-${version}.tar.bz2",
  $archive        = "fields-${version}.tar.bz2",
  $checksum       = 'dca1df6a01aff55240f3316d97198b5d8f7414aa6b3e9e72d146a31a8c435fe6',
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
