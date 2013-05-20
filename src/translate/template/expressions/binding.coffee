# {{binding}}
class Binding extends require("./base")

  _type: "binding"

  ###
  ###

  constructor: (@script, @children) ->
    super()
    @addChild @children

  ###
  ###

  toJsString: () -> "this.#{@toMethodString()}"

  ###
  ###

  toString: () -> "').#{@toMethodString()}.html('"


  ###
  ###

  toMethodString: () -> "blockBinding(#{@script}, function(){ return paper.create().html('#{@children.toString()}')})"

module.exports = Binding