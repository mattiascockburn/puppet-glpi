# Install the formcreator plugin
#
# @summary Install the formcreator plugin
#
# @example
#   include glpi::plugin::formcreator
class glpi::plugin::formcreator (
  $manage_prereqs = true,
  $version        = '2.10.1',
  $url            = "https://github.com/pluginsGLPI/formcreator/releases/download/v${version}/glpi-formcreator-${version}.tar.bz2",
  $archive        = "formcreator-${version}.tar.bz2",
  $checksum       = '0f8a765180d143fdf267d60843d9385596dae7dbc4dcbadf1fd7ed9cd9136cbb',
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
    creates         => "${archive_dest}/formcreator/README.md",
    cleanup         => true,
    user            => $glpi::owner,
    group           => $glpi::group,
    require         => File[$glpi::archive_dest],
    }

}
