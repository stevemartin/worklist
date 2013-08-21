describe("directives", function(){

  describe("wlEditable directive", function(){
    var scope, compile,el;

    beforeEach(module("worklist"));

    beforeEach(inject(function($rootScope, $compile) {
      scope = $rootScope.$new();
      scope.editing = false;
      compile = $compile;
      el = angular.element('<h1 wl-editable default-text="Enter title">Editable</h1>');
      compile(el)(scope);
    }));

    it("should make content editable when clicked", function(){

      el.triggerHandler('click');

      expect(el.attr('contentEditable')).toBe('true');
    });

    it('should set contentEditable to false on blur', function(){
      el.triggerHandler('click');
      expect(el.attr('contentEditable')).toBe('true');
      el.triggerHandler('blur');
      expect(el.attr('contentEditable')).toBe('false');
    });

    //@TODO: test that we can update the scope to show the log in bar
    // it('should set scope.editing to be true when clicked', function(){
    //   el.triggerHandler('click');
    //   expect(scope.editing).toBe(true);
    // });

    it('should add a class of editing to the element', function(){
      el.triggerHandler('click');
      expect(el.attr('contentEditable')).toBe('true');
      expect(el.hasClass('is-editing')).toBe(true);
    });

    it('should remove the editing class on blur', function(){
      el.triggerHandler('click');
      expect(el.hasClass('is-editing')).toBe(true);
      el.triggerHandler('blur');
      expect(el.hasClass('is-editing')).toBe(false);
    });

    it('should add the placeholder text when the element text', function(){
      el.triggerHandler('click');
      el.text('');
      expect(el.text()).toBe('');
      el.triggerHandler('blur');
      expect(el.text()).toBe('Enter title');
    });

  });

});
