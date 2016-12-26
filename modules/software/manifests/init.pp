class software {
  $syspackages= [
    'apache2',
    'dnsutils',
    'colordiff',
    'curl',
    'exim4',
    'exuberant-ctags',
    'git-core',
    'htop',
    'lsof',
    'lynx',
    'mercurial',
    'moreutils',
    'ncftp',
    'netcat',
    'nmap',
    'postgresql',
    'python-software-properties',
    'ruby',
    'screen',
    'subversion',
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
}


