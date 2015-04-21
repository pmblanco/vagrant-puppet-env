class profiles::mco (
  $hosts,
  $connector,
  $client = false
) {
  
  class {'mcollective':
    middleware_hosts    => $hosts,
    connector           => $connector,
    client              => $client
  }

  mcollective::plugin { 'puppet':
    package    => true,
  }


}
