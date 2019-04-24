# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::config
class glpi::config (
){
  if $facts['selinux'] {
    file{"${glpi::archive_dest}/config":
      seltype => 'httpd_sys_rw_content_t',
    }
    file{"${glpi::archive_dest}/files":
      seltype => 'httpd_sys_rw_content_t',
    }
  }
  if $glpi::manage_database {
    mysql::db { $glpi::db_name:
    user     => $glpi::db_user,
    password => $glpi::db_password,
    host     => $glpi::db_host,
    grant    => ['*'],
    }
  }
}
