class eciroles::confmanager::puppetmaster::test {

  class { 'eciprofiles::common':
    install_puppet_agent   => false,
    install_mcollective    => false,
  } ->

  class { 'eciprofiles::confmanager::puppet_master':
  }

}
