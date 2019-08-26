# @author Sanket Shirode
#
# @summary This class is responsible for executing kcare commands on agent nodes
#
# @example
#   include kernelcare::commands
#
class kernelcare::commands(
  $execute_patch   = $kernelcare::execute_patch,
  $execute_unpatch = $kernelcare::execute_unpatch,
  $execute_check   = $kernelcare::execute_check,
  $servertag       = $kernelcare::servertag,
) {
  if $execute_check == true {
    kernelcare::execute_command_define { 'check updates':
      command => 'check',
    }
  }

  if $execute_patch == true {
    kernelcare::execute_command_define { 'patch updates':
      command => 'patch',
    }
  }

  if $execute_unpatch == true {
    kernelcare::execute_command_define { 'unpatch updates':
      command => 'unload',
    }
  }

  if $servertag != undef {
    exec { 'tag server':
      path      => ['/usr/bin/','/usr/sbin/'],
      command   => "kcarectl --tag ${servertag}",
      logoutput => true,
    }
  }
}
