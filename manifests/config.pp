# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include glpi::config
class glpi::config (
){
  if $glpi::manage_database {
    mysql::db { $glpi::db_name:
    user     => $glpi::db_user,
    password => $glpi::db_password,
    host     => $glpi::db_host,
    grant    => ['*'],
    }
  }
}
