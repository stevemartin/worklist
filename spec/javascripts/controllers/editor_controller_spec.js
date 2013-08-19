describe("controllers", function(){
  beforeEach(module("worklistApp"));

  describe("EditCtrl", function(){
    beforeEach( inject(function($rootScope,$controller){
      $scope = $rootScope.$new();
      var ctrl = $controller('EditCtrl', {
	$scope: $scope
      });
    }));

    it("should initialise with scope editable false", function(){
      expect($scope.editable).toBe(false);
    });

  });

});
