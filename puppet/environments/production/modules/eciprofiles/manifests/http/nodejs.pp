class eciprofiles::http::nodejs {

  class { '::nodejs':
    make_install => false,
  }

}

