class roles::common (
  $install_mcollective   = true
){

  case $::operatingsystem {

    'Ubuntu': {
      class {'roles::common::ubuntu':
      }
    }
	
	'CentOS','RedHat': {
	  class {'roles::common::redhat':
	  }
	}

  }

  class { 'puppet::repo':
  }
  
  if $install_mcollective {
    class { 'mcollective':
      middleware_hosts      => [ '192.168.5.16' ],
	  connector             => 'rabbitmq',
    }
  }
  
}
