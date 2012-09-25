class demo {
  class { 'mysql::server':
    config_hash           => {
      'root_password' => 'password'
    },
  } ->

  mysql::db { 'wordpress':
    user     => 'wordpress',
    password => 'wordpress',
    grant    => all,
    sql      => '/opt/wordpress/wordpress.mysql',
  } ->

  class { 'wordpress':
    wordpress_db_name     => 'wordpress',
    wordpress_db_user     => 'wordpress',
    wordpress_db_password => 'wordpress',
  }
}
