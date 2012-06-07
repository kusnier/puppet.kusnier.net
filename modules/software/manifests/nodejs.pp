class software::nodejs {
  addrepository { 'ppa:chris-lea/node.js':
    creates  =>  '/etc/apt/sources.list.d/chris-lea-node.js-lucid.list',
    packages => ['nodejs', 'npm']
  }
}
