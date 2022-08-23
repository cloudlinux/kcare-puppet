# @author Sanket Shirode
#
# @summary This class is responsible for registering server to eportal
#
# @example
#   include kernelcare::register
#
class kernelcare::register(
  $registration_key = $kernelcare::registration_key,
) {
  if $registration_key != undef {
    exec { 'register server':
      path      => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
      command   => "kcarectl --register ${registration_key}",
      creates   => '/etc/sysconfig/kcare/systemid',
      logoutput => true,
    }
  }
}
