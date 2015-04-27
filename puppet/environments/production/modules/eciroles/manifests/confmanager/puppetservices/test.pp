class eciroles::confmanager::puppetservices::test {
  
  class { 'eciprofiles::common':
  }

  class { 'eciprofiles::confmanager::puppet_services':
  }

}
