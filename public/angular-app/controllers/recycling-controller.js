separa.controller('recyclingCtrl',['$scope','recyclingFactory',function($scope, recyclingFactory) {
    console.log("controlador de recycling");

    $scope.categories = [];
    $scope.success = true;

    recyclingFactory.separate(function(separate) {
        // Store in local store
        var separateData = JSON.stringify(separate);
        //console.log(separateData);
        localStorage.setItem('separateData', separateData);
        var separate = JSON.parse(localStorage.getItem('separateData'));
        //console.log(separate);
        $scope.separate = separate;

    },function(error) {
        console.log('Error:');
        console.log(error);
        // alert('Error: ' + error);

    });


    //    recyclingFactory.query().$promise.then(
    //        function(respuesta){
    //            $scope.usuarios = respuesta;
    //            console.log($scope.usuarios);
    //        },
    //        function(err){
    //            console.log(err);
    //        });


        $scope.showSubcategory = function(category, wasteType) {
          //$scope.recyclingNavigator.pushPage('subcategories.html');
          $scope.currentCategory = category;
          $scope.currentWasteType = wasteType;
        }
    //
    //
    //
    //    $scope.showImage = function(subcat) {
    //      subcatImageModal.show();
    //      $scope.subcat = subcat;
    //    }

}]);
