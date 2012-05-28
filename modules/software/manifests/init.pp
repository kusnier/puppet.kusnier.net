class software {
  $syspackages= [
    'apache2',
    'colordiff',
    'curl',
    'exuberant-ctags',
    'git-core',
    'htop',
    'libapache2-mod-php5',
    'lsof',
    'lynx',
    'mercurial',
    'ncftp',
    'netcat',
    'nmap',
    'php5',
    'php5-mysql',
    'phpmyadmin',
    'ruby',
    'screen',
    'subversion',
    'svnmailer',
    'tcpdump',
    'traceroute',
    'tree',
    'unrar-free',
    'unzip',
    'vim',
    'wget',
    'zsh',
  ]

  package { $syspackages:
    ensure => installed,
  }

  package { 'exim4-config':
    ensure       => installed,
    # debconf-get-selections | grep exim4-config
    responsefile => 'puppet://modules/software/exim4-config.debconf',
  }

}


