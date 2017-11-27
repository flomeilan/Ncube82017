var expect = require('chai').expect;

module.exports = (function() {

  var file;

  return {
    set: function(fileObj) {
      file = fileObj;
    },
    register: function() {
      it('should exist', function() {
        expect(file).to.be.an('object');
      });

      it('should contain custom override style definition', function() {
        expect(file.contents.toString()).to.contain('.test-override-class {');
      });
    }
  };

}());
