var protoclass = require("protoclass");
var utils      = require("../../../utils");

/**
 */

function UnboundBlockBinding(node, script, view) {
  this.view   = view;
  this.document = view.template.document;
  this.script = script;
  this.node   = node;
}

/**
 */

module.exports = protoclass(UnboundBlockBinding, {

  /**
   */

  bind: function() {
    var self = this;
    var value = this.script.evaluate(this.view);
    if (this.value === value) return;
    this.value = value;

    var v = String(value == null ? "" : value);

    if (this.document !== global.document) {
      this.node.replaceText(v, true);
    } else {
      this.node.nodeValue = String(v);
    }
  },

  /**
   */

  unbind: function() { }
});
