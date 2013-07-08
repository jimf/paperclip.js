escapeHTML = require "../../utils/escapeHTML"

class TextBinding extends require("./base")
  
  ###
  ###

  constructor: (node, @attrName, @clippedBuffer) ->
    super node

  ###
  ###

  bind: () ->
    super()
    @clippedBuffer.bind("text").to @_onChange

  ###
  ###

  load: (@context) ->
    @clippedBuffer.reset context

    if @clippedBuffer.text.length and @clippedBuffer.text isnt "[object Object]"
      context.buffer.push " #{@attrName}=\"#{@clippedBuffer.text}\""


  ###
  ###

  _onChange: (value) =>
    $(@node.section.elements[0]).attr(@attrName, escapeHTML(value))

module.exports = TextBinding