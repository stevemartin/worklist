describe("controllers", function(){
  beforeEach(module("worklist"));

  describe("EditCtrl", function(){
    beforeEach( inject(function($rootScope,$controller){
      $scope = $rootScope.$new();
      var ctrl = $controller('EditCtrl', {
	$scope: $scope
      });
    }));

    it("should initialise with scope editable false", function(){
      expect($scope.editing).toBe(false);
    });

    // it('should set set view menu to true when called', function(){
    //   expect($scope.showMenu).toBe(false);
    //   $scope.toggleMenu();
    //   expect($scope.showMenu).toBe(true);
    // });
  });

});
