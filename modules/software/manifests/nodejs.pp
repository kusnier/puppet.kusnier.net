class software::nodejs {
  software::addrepository { 'ppa:chris-lea/node.js':
    creates  =>  "/etc/apt/sources.list.d/chris-lea-node_js-${lsbdistcodename}.list",
    packages => ['nodejs']
  }
}
