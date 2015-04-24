node 'puppet1.vag.ardemans.int' {

  class { 'eciroles::confmanager::puppetmaster::test':
  }
  
}

node 'dashboard1.vag.ardemans.int' {

  class { 'eciroles::confmanager::puppetservices::test':
  }

}


node 'web1.vag.ardemans.int' {

  class { 'eciroles::http::nodejs::test':
  }

}
