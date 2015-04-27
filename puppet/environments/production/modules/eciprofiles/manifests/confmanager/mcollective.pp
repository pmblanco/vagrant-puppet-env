class eciprofiles::confmanager::mcollective (
  $hosts,
  $connector,
  $client = false,
  $plugins = ['puppet','service','package','iptables','filemgr','nrpe','nettest'],
) {
  
  class { '::mcollective':
    middleware_hosts    => $hosts,
    connector           => $connector,
    client              => $client
  }

  mcollective::plugin { $plugins:
    package    => true,
  }


}
