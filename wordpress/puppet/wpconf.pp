$db_password = $::wp_db_password
$db_host = $::default_gateway

file { "/wordpress/wp-config.php":
  content => template("wp-config.php.erb"),
}
