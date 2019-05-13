# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::config
class glpi::config (
){
  if $facts['selinux'] and $glpi::manage_selinux {
    file{"${glpi::archive_dest}/config":
      seltype => 'httpd_sys_rw_content_t',
    }
    file{"${glpi::archive_dest}/files":
      seltype => 'httpd_sys_rw_content_t',
    }
    ['cache', 'cron', 'dumps', 'graphs', 'lock', 'log', 'pictures', 'plugins', 'rss', 'sessions', 'tmp', 'uploads'].each |String $subdir| {
      file{"${glpi::archive_dest}/files/_${subdir}":
        seltype => 'httpd_sys_rw_content_t',
      }
    }
    if $glpi::use_ldap {
      # Needed for LDAP Sync
      selboolean{'httpd_can_connect_ldap':
        value      => 'on',
        persistent => true,
      }
    }
  }
  if $glpi::manage_database {
    mysql::db { $glpi::db_name:
      user            => $glpi::db_user,
      password        => $glpi::db_password,
      host            => $glpi::db_host,
      grant           => ['ALL'],
      mysql_exec_path =>
    }
  }
}
