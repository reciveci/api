modulo.controller('MapController',['$scope',function($scope) {




  map = L.map('map2').setView([-0.1971527023738858, -78.49267959594727], 13);

        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiamExOTc5IiwiYSI6ImNpazcyZHFtcjAxOGJ2ZGt0NGNhamQ1cXQifQ.Kkz4bJY_fOE6PM9YaWzJIg',
                    {
            attribution: 'Map data &copy; <a href="http://openo streetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
            maxZoom: 18,
            id: 'mapbox.streets'
        }).addTo(map);


        map.on("zoomend", function (e) {
          //if (localStorage.showLayerSectionsOrRoutes == "true") {
            $scope.showLayerSectionsOrRoutes();
          //}
        });



     $scope.openProfile = function(feature) {
     window.location.href="profile.html"
      
      $scope.currentWastePicker = feature.properties;
     
      //console.log(feature.properties);
     
      localStorage.setItem("foto",feature.properties["waste_picker-image_url"]);
      localStorage.setItem("nombre",feature.properties["waste_picker-name"]);
      localStorage.setItem("mensaje",feature.properties["waste_picker-message"]);
      localStorage.setItem("horario",feature.properties["schedule"]);
      localStorage.setItem("asociacion",feature.properties["affiliation-name"]);
      localStorage.setItem("info_adicional",feature.properties["waste_picker-background"]);
      localStorage.setItem("edad",feature.properties["waste_picker-birth_date"]);
      localStorage.setItem("tiempo_Reci",feature.properties["waste_picker-start_date"]);

     
    };


   $scope.showLayer=function(layer) {
      if (!map.hasLayer(layer)) {
        layer.addTo(map);
      }
    };

    $scope.hideLayer=function (layer) {
      if (map.hasLayer(layer)) {
        map.removeLayer(layer);
      }
    };

    $scope.showLayerSectionsOrRoutes=function () {
      if (map.getZoom() >= 15 ) {
        $scope.hideLayer(layerSectors);
        $scope.showLayer(layerRoutes);
        // Info popup
        $scope.showMapAlert();
      } else {
        $scope.hideLayer(layerRoutes);
        $scope.showLayer(layerSectors);
      }
    };

    $scope.hideLayerSectionsOrRoutes=function() {
      $scope.hideLayer(layerSectors);
      $scope.hideLayer(layerRoutes);
    };




    $scope.showMapAlert=function () {
      var mapAlertExecuted = localStorage.getItem('mapAlertExecuted');
      if (mapAlertExecuted == null) {
          localStorage.setItem('mapAlertExecuted', 'Y');
          popup = L.popup()
              .setLatLng(map.getCenter())
              .setContent("Haz un tab sobre cada línea para</br>conocer a <strong>l@s reciclador@s<strong>")
              .openOn(map);
      }
    };


    function style(feature) {
      return {color: feature.properties.color,
              weight: feature.properties.weight,
              opacity: feature.properties.opacity};
    }


    function getStyle(feature) {
        return {color: feature.properties.color,
                weight: feature.properties.weight,
                opacity: feature.properties.opacity};
    }




    function onEachFeature(feature, layer) {
        // does this feature have a property named popupContent?
        if (feature.properties && feature.properties.schedule) {
          var container = $('<div/>');
    // Delegate all event handling for the container itself and its contents to the container
    container.on('click', '.profile-link', function() {
      
    $scope.openProfile(feature);
     
    
   

    });
            container.html("<div class='map-popup' ng-app='modelo' ui-sref='profile'>" +
                "<a class='profile-link' href='#'>" +
                "<div class='centered'><img class='wastepickerpic' src='" + feature.properties["waste_picker-image_url"] + "'/></div>" +
                "<div class='text-center' style='color: " + feature.properties["color"] + "; opacity: 0.5;'>@" + feature.properties["waste_picker-name"] + "</div>" +
                "</a>" +
                "</div>");
    
    layer.bindPopup(container[0]);
        }
    }




    function onEachFeatureAffilliations(feature, layer) {
       var container = $('<div />');
                // Delegate all event handling for the container itself and its contents to the container
                /*container.on('click', '.profile-link', function() {
                    $scope.openAffiliation(feature);
                });*/
                // Insert whatever you want into the container, using whichever approach you prefer
                container.html("<div class=map-poup >"+"<a class='profile-link' href='#'>"+feature.properties["name"]+"</div>"+
                               "<div class=map-content-popup>"+feature.properties["address"]+"</div>"
                              );

                // Insert the container into the popup
                layer.bindPopup(container[0]);
        var imagen = new L.icon({iconUrl:"/images/acopio3.png", iconAnchor:[24,56]});
        layer.setIcon(imagen);

    }




    var routes;

   $.getJSON("http://api-reciveci.rhcloud.com/map/routes.json", function(data) {

      routes = data ;
     
      layerRoutes=L.geoJson(routes, {style: style, onEachFeature: onEachFeature})//.addTo(map);
    });








    var business;

   $.getJSON("http://localhost:3000/map/business.json", function(data) {

      business = data ;
      console.log(business);
      L.geoJson(business, {style: getStyle, onEachFeature: onEachFeature}).addTo(map);
    });









  var affiliations

 $.getJSON("http://localhost:3000/map/affiliations.json", function(data) {

    affiliations = data ;
    console.log(affiliations);
    layerAffiliations=L.geoJson(affiliations, {style: style, onEachFeature: onEachFeatureAffilliations})//.addTo(map);
     //layer.setIcon(imagen);
  });






var sectors
   $.getJSON("http://localhost:3000/map/sectors.json", function(data) {

      sectors = data ;
      console.log(sectors);
      layerSectors=L.geoJson(sectors, {style: style, onEachFeature: onEachFeature}).addTo(map);
    });



$('#floresta').on('click',function(){



 map.setView(new L.LatLng(-0.181451, -78.480030), 16);


 });



$('#salvador').on('click',function(){



 map.setView(new L.LatLng(-0.207280,-78.4871193), 16);


 });

$('#todos').on('click',function(){



 map.setView(new L.LatLng(-0.1971527023738858, -78.49267959594727), 13);


 });





    $('input').on('click',function(){


      value=$(this).attr('id');
      checked=$(this).prop('checked');

          
      
      if(value=="recicladoras"){
          if(checked==true){


          $scope.showLayerSectionsOrRoutes();
          }
          else{

           $scope.hideLayer(layerRoutes);
          }
      }
      else if(value=="acopios"){
          if(checked==true){


          $scope.showLayer(layerAffiliations);
          }
          else{

           $scope.hideLayer(layerAffiliations);
          }
      }



    })


$(window).resize(function(){





height=$(window).height();
width=$(window).width();



if(width<1013){

$('#navbar').removeClass('full');
$('#navbar').addClass('responsive');




}

}
  );









}])