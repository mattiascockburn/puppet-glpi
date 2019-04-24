# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::install
class glpi::install (
) {
  if $glpi::manage_php {
    class { '::php::globals':
      php_version => $glpi::php_version,
      rhscl_mode  => 'rhscl',
    }
    ->
    class { '::php':
      manage_repos => false,
      settings     => $glpi::php_settings,
      fpm_user     => $glpi::owner,
      fpm_group    => $glpi::group,
    }
  }

  if $glpi::manage_packages {
    ensure_packages($glpi::packages)
  }

  exec{'glpi_create_basedir':
    command => "mkdir -p ${glpi::basedir}",
    path    => ['/bin','/usr/bin'],
    creates => $glpi::basedir,
  } ->
  file { $glpi::archive_dest:
    ensure  => directory,
    owner   => $glpi::owner,
    group   => $glpi::group,
    mode    => '0755',
  }

  file { "${glpi::basedir}/current":
  ensure  => 'link',
  target  => "$glpi::archive_dest"
  }

  archive { $glpi::archive_name:
    path            => "/var/tmp/${glpi::archive_name}",
    source          => $glpi::url,
    checksum        => $glpi::sha1sum,
    checksum_type   => 'sha1',
    extract_command => 'tar xfz %s --strip-components=1',
    extract         => true,
    extract_path    => $glpi::archive_dest,
    creates         => "${glpi::archive_dest}/README.md",
    cleanup         => true,
    user            => $glpi::owner,
    group           => $glpi::group,
    require         => File[$glpi::archive_dest],
    }
}
