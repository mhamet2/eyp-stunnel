class stunnel::service inherits stunnel {

  #
  validate_bool($stunnel::manage_docker_service)
  validate_bool($stunnel::manage_service)
  validate_bool($stunnel::service_enable)

  validate_re($stunnel::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${stunnel::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $stunnel::manage_docker_service)
  {
    if($stunnel::manage_service)
    {
      service { $stunnel::params::service_name:
        ensure => $stunnel::service_ensure,
        enable => $stunnel::service_enable,
      }
    }
  }
}
