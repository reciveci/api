modulo.controller('PerfilController',['$scope',function($scope) {

$scope.edad=localStorage.getItem('edad');
$scope.tiempo_reci=localStorage.getItem('tiempo_Reci');

foto=localStorage.getItem('foto');
nombre=localStorage.getItem('nombre');
mensaje=localStorage.getItem('mensaje');
horario=localStorage.getItem('horario');
asociacion=localStorage.getItem('asociacion');
info=localStorage.getItem('info_adicional');



$( document ).ready(function() {
    

    $('#img').attr("src",foto);
    $('#nombre').text("@"+nombre);
    $('#mensaje').text("''"+mensaje+"''");
    $('#horario').text(horario);
    $('#asociacion').text(asociacion);
    $('#info_adicional').text(info);
});



}])