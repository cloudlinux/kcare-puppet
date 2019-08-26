# @author Sanket Shirode
#
# @summary: This class ensures kcare service is running on agent nodes
#
# @example
#   include kernelcare::service
#
class kernelcare::service {

  service { 'kcare':
    ensure => 'running',
    enable => true,
  }
}
