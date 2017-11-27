var expect = require('chai').expect;

module.exports = (function() {

  var json;

  return {
    setJson: function(obj) {
      if (obj.contents) {
        json = JSON.parse(obj.contents);
      } else {
        json = obj;
      }
    },
    register: function() {
      it('should exist', function() {
        expect(json).to.be.an('object');
      });

      it('pug sections exists', function() {
        expect(json.sections[4]).to.be.an('object');
        expect(json.sections[5]).to.be.an('object');
        expect(json.sections[6]).to.be.an('object');
      });

      it('pug is compiled', function() {
        expect(json.sections[4].markup).to.contain('<div class="block block_modifier">');
      });

      it('pug markup are saved for doc', function() {
        expect(json.sections[4].markupPug).to.be.an('string');
        expect(json.sections[4].markupPug).to.contain('.block.block_modifier');
      });

      it('pug with bem is compiled', function() {
        expect(json.sections[5].markup).to.contain('<div class="bemblock bemblock_modifier">');
      });

      it('plain html is still works', function() {
        expect(json.sections[6].markup).to.contain('<div class="htmlblock htmlblock_modifier">');
      });
    }
  };

}());
