# @author Sanket Shirode
#
# @summary This is a define for executing commands
#
# @example
#   kernelcare::execute_command_define { 'namevar': }
# 
# @param command
#   The name of the command to execute on the server
#
define kernelcare::execute_command_define (
  $command,
) {
  exec { $title:
      path      => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
      command   => "kcarectl --${command}",
      logoutput => true,
    }
}
