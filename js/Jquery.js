
/*con este jquery tomamos los datos de la bd y las ponemos en el modal de bootstrap*/    
$(document).on("click", ".open-test", function () {

     var nombre = $(this).data('name');
     var nombre2 = $(this).data('apepat');
     var nombre3 = $(this).data('apemat');
     $(".modal-body #nom").text( nombre +" "+ nombre2 +" "+ nombre3);          
                 var nombre4 = $(this).data('mail');
                 $(".modal-body #mail").text( nombre4 );
                     var nombre5 = $(this).data('rut');
                     $(".modal-body #rut").text( nombre5 );

                     


                         var nombre6 = $(this).data('forprof');
                         $(".modal-body #forprof").text( nombre6 );
                             var nombre7 = $(this).data('year');
                             $(".modal-body #year").text( nombre7 );
                                 var nombre8 = $(this).data('carrera');
                                 $(".modal-body #carrera").text( nombre8 );
                                     var nombre9 = $(this).data('instit');
                                     $(".modal-body #instit").text( nombre9 );
                                         var nombre10 = $(this).data('fecha');
                                         $(".modal-body #fecha").text( nombre10 );
});
