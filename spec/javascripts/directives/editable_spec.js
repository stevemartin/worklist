describe("directives", function(){

  describe("wlEditable directive", function(){
    var scope, compile,el;

    beforeEach(module("worklist"));

    beforeEach(inject(function($rootScope, $compile) {
      scope = $rootScope.$new();
      compile = $compile;
      el = angular.element('<h1 wl-editable>Editable</h1>');
      compile(el)(scope);
    }));

    it("should make content editable when clicked", function(){

      el.triggerHandler('click');
      // scope.$digest();

      expect(el.attr('contentEditable')).toBe('true');
    });

    it('should set contentEditable to false on blur', function(){
      el.triggerHandler('click');
      expect(el.attr('contentEditable')).toBe('true');
      el.triggerHandler('blur');
      expect(el.attr('contentEditable')).toBe('false');
    });
  });

});
