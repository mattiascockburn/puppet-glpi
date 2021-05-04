# Install the formcreator plugin
#
# @summary Install the formcreator plugin
#
# @example
#   include glpi::plugin::formcreator
class glpi::plugin::formcreator (
  $manage_prereqs = true,
  $version        = '2.11.3',
  $url            = "https://github.com/pluginsGLPI/formcreator/releases/download/v${version}/glpi-formcreator-${version}.tar.bz2",
  $archive        = "formcreator-${version}.tar.bz2",
  $checksum       = '70240bbd79622272f8a470c3a4ff90a2326414cf130ae98f392624ba75456474',
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
