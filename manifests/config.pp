# @author Sanket Shirode
#
# @summary This class is responsible for configuring kernel
#
# @example
#   include kernelcare::config
#
class kernelcare::config {
  file {'/etc/sysconfig/kcare/kcare.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => epp('kernelcare/kcare.conf.epp'),
    notify  => Service['kcare'],
  }
}
