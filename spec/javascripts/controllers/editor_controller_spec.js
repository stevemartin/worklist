describe("controllers", function(){
  beforeEach(module("worklist"));

  describe("EditCtrl", function(){
    var testWorkList = {
      "name": "John Doe",
      "address": "1 High Street, City, County, 123343",
      "email": "test@example.com",
      "summary": "Lorem ipsum dolor sit amet"
    }, mockBackend;

    beforeEach( inject(function($rootScope,$controller,_$httpBackend_, WorkList){
      $scope = $rootScope.$new();
      var ctrl = $controller('EditCtrl', {
	$scope: $scope,
	WorkList: new WorkList({id: 1, name: "John Doe"})
      });
      mockBackend = _$httpBackend_;
      dump("MBE:", mockBackend );
    }));

    it("should initialise with iniitial auth settings", function(){
        expect($scope.showSignUp).toBe(false);
        expect($scope.showSignIn).toBe(false);
        expect($scope.showSignOut).toBe(false);
    });

    xit("should save the worklist", function(){
      mockBackend.expectPOST('/users/sign_in.json', testWorkList).respond({status:'success'});
      mockBackend.expectPOST('/worklist/1', testWorkList).respond({id:2});

      expect($scope.workList).toBeUndefined();

      $scope.workList = testWorkList;
      //expect backend to have been called

      expect($scope.workList.name).toEqual(testWorkList.name);
      mockBackend.flush();

    });
  });
});
