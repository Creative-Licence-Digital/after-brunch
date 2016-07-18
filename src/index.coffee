sysPath = require 'path'
{exec}  = require 'child_process'

module.exports = class AfterBrunch
  brunchPlugin: yes


  AfterBrunch::params =
      disableOnWatch: false
      commands: []


  constructor: (@config) ->
    @params.disableOnWatch = @config.plugins.afterBrunch.disableOnWatch ? false
    if @config.plugins.afterBrunch.commands == undefined
        @params.commands = @config.plugins.afterBrunch ? []
    else if (@params.disableOnWatch is false) or 
        (@params.disableOnWatch is true and @config.persistent is false)
            @params.commands = @config.plugins.afterBrunch.commands ? []
    return

  onCompile: (generatedFiles) ->
    for command in @params.commands
      exec command, (error, stdout, stderr) ->
        console.log stdout if stdout
        console.log error.message if error
        console.log stderr if stderr



    return
