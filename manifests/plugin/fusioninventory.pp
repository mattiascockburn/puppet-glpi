# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::plugin::fusioninventory
class glpi::plugin::fusioninventory (
  $version       = '9.4+1.1',
  $url           = "https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi${version}/fusioninventory-${version}.tar.bz2",
  $archive       = "fusioninventory-${version}.tar.bz2",
  $checksum      = '12bb42d349393c7d3ede72a9f98672d0ecbcc58a87ebfad8f15a2ecefa455e5e',
  $checksum_type = 'sha256',
  $archive_dest  = "${glpi::archive_dest}/files/_plugins/",
){
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
