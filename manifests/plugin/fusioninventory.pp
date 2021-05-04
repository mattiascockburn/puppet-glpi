# Install the fusion inventory plugin
#
# @summary Install the fusion inventory plugin
#
# @example
#   include glpi::plugin::fusioninventory
class glpi::plugin::fusioninventory (
  $manage_prereqs = true,
  $version        = '9.5+3.0',
  $url            = "https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi${version}/fusioninventory-${version}.tar.bz2",
  $archive        = "fusioninventory-${version}.tar.bz2",
  $checksum       = '11e41b2e6ab32172fd9851ead8c2e3439f9968938e054cd8f078694c9f03c461',
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
    creates         => "${archive_dest}/fusioninventory/README.md",
    cleanup         => true,
    user            => $glpi::owner,
    group           => $glpi::group,
    require         => File[$glpi::archive_dest],
    }

}
