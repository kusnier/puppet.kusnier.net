class software::mysql {
  package { 'mysql-server':
      ensure => installed,
  }
}
