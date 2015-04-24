class eciprofiles::common (
  $install_mcollective = true,
  $install_puppet_agent = true
) {

  case $::operatingsystem {
    'Ubuntu': {
      class { 'eciprofiles::common::ubuntu':
      }
    }

    'CentosOS','RedHat': {
      class { 'eciprofiles::common::redhat':
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
    class { 'eciprofiles::mcollective':
      hosts      => [ '192.168.5.16' ],
      connector  => 'rabbitmq',
      client     => false,
    }
  }

  if $install_puppet_agent {
    class { 'puppet::agent':
      report         => 'true',
      masterserver   => 'puppet1.vag.ardemans.int',
      service_status => 'stopped',
      rundir         => '/var/run/puppet',
      ssldir         => '/var/lib/puppet/ssl',
    }
  }

}
