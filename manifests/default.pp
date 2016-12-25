include system
include system::users
include software
include software::mongo
include software::mysql
include software::mosh
include restore::mongo
include restore::mysql
include restore::apache
include restore::sshd
include restore::userfiles

# puppet describe -s user
# puppet resoruce user
# puppet resoruce user seek --edit

notify {"seek":
  message    => 'Starte puppet mit meiner Konfiguration',
  name       => 'seek-info',
  withpath   => true
}

# exec { 'apt-get-update':
#   command => '/usr/bin/apt-get update'
# }
#
# exec { 'apt-get-upgrade':
#   command => '/usr/bin/apt-get upgrade -y'
# }
