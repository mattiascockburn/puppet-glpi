# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::plugin::formcreator
class glpi::plugin::formcreator (
  $manage_prereqs = true,
  $version        = '2.8.5',
  $url            = "https://github.com/pluginsGLPI/formcreator/releases/download/v${version}/glpi-formcreator-${version}.tar.bz2",
  $archive        = "formcreator-${version}.tar.bz2",
  $checksum       = '7ac2c8449c016ca67f35f4b11c88dfe929a93bc483b1fc534c1cedbd47a494f7',
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
