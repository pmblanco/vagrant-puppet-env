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

  include firewall

  resources { 'firewall':
    purge => true,
  }

  class { 'puppet::repo':
  }
  
  if $install_mcollective {
    class { 'profiles::mco':
      hosts      => [ '192.168.5.16' ],
      connector  => 'rabbitmq',
      client     => false,
    }
  }
  
}
