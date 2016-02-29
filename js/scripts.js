

$(document).ready(function () {
    $('#btnreg2').click(function () {//funcion desabilitar

        $.ajax({
            url: "controller.asp?action=deshabilita_practica",
            dataType: "json",
            data: "desabilita=" + $('#disid2').val()
        })//fin ajax
                                    .done(function (data) {

                                        if (data.success) {


                                            $('#myModal2').modal('hide');
                                            recargar();
                                        } else {

                                            alert("registro fallido")
                                        }


                                    })//fin done ajax 
                                    .fail(function (jqXHR, textStatus, errorThrown) {
                                        message = "Problema Con el Servidor";
                                        $('#btnreg').popover({ 'placement': 'top', 'content': message }).popover('show');


                                    });

    }); //fin desabilitar
    $('#btnreg3').click(function () {//funcion reactivar 

        $.ajax({
            url: "controller.asp?action=activa_practica",
            dataType: "json",
            data: "activa=" + $('#disid3').val()
        })//fin ajax
                                    .done(function (data) {

                                        if (data.success) {


                                            $('#myModal3').modal('hide');
                                            recargar();

                                        } else {

                                            alert("registro fallido")
                                        }


                                    })//fin done ajax 
                                    .fail(function (jqXHR, textStatus, errorThrown) {
                                        message = "Problema Con el Servidor";
                                        $('#btnreg').popover({ 'placement': 'top', 'content': message }).popover('show');


                                    });

    }); //fin reactivar


    function recargar() {
        $.ajax({
            url: "controller.asp?action=mostrarpracticaeditar",
            dataType: "json"


        })//fin ajax 
       .done(function (data) {
           var markup, table, row, button, boton1, boton2, boton3, boton4;
           if (data.success) {
               //JSON.stringify(jsonlogin[1].Dis_cod)
               //buscamos dentro de el json y lo vamos mostrando por linea y lo insertamos en el div con id example

               markup = '<table class="table table-striped table-hover">';
               markup += '  <thead>';
               markup += ' 	<tr>';
               markup += ' 		<<th>#</th>';
               markup += ' 		<th>Nombre</th>';
               markup += ' 		<th>Direccion</th>';
               markup += ' 		<th>Tutor</th>';
               markup += ' 		<th>Estado</th>';
               markup += ' 		<th>Acciones</th>';
               markup += ' 	</tr>';
               markup += ' </thead>';
               markup += ' <tbody></tbody>';
               markup += '</table>';
               table = $(markup);

               $.each(data.Practicas, function (value, key) {

                   if (key.Dis_Estado == '1') {



                       row = $('<tr class="danger">')
                       .append('<td>#' + value + '</td>')
                       .append('<td style="width: 316px;"><p>' + key.Dis_Nombre + '</p></td>')
                       .append('<td><p style="margin-bottom: 0px;">' + key.corporativa + '</p><p style="margin-bottom: 0px;">' + key.gerencia + '</p><p style="margin-bottom: 0px;">' + key.uorg + '</p></td>')
                       .append('<td><p style="margin-bottom: 0px;">' + key.nomcom + '</p><p style="margin-bottom: 0px;">' + key.Dis_Fecha_Termino + '</p></td>')
                       .append('<td><p>"inactivo"</p></td>');
                       button = $('<div></div>')

                       boton1 = $('<a href="#" class="btn btn-primary open-test" data-disid="' + key.Dis_Id + '" data-tipo="' + key.Tip_Practica + '"style="margin-top: 0;cursor:pointer"data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-cog"></i></a>').click(function (event) {
                           $(".modal-body #nompos2").val(key.Dis_Nombre);
                           $(".modal-body #descrip2").val(key.Dis_Descripcion);
                           $(".modal-body #nomtut2").val(key.nomcom);
                           $(".modal-body #direccion2").val(key.corporativa);
                           $(".modal-body #rut2").val(key.ruteje);
                           $(".modal-body #codneg2").val(key.codneg);
                           $(".modal-body #gerencia2").val(key.gerencia);
                           $(".modal-body #unidad2").val(key.uorg);
                           $(".modal-body #datepicker3").val(key.Dis_Fecha_Inicio);
                           $(".modal-body #datepicker23").val(key.Dis_Fecha_Termino);

                           //actualizarListasCarreras(key.carreras)
                       })


                       boton2 = $('<a href="#" class="btn btn-info" id="tabgo" style="margin-top: 0; margin-left: 2px;" ><i class="glyphicon glyphicon-file"></i></a>')
                       boton3 = $('<a href="#" class="btn btn-success" style="margin-top: 0; margin-left: 2px;"><i class="glyphicon glyphicon-envelope"></i></a>')
                       boton4 = $('<a href="#" class="btn btn-warning open-test3" style="margin-top: 0; margin-left: 2px;" data-toggle="modal" data-target="#myModal3" data-disid3="' + key.Dis_Id + '"><i class="glyphicon glyphicon-thumbs-up"></i></a>');
                       button.append(boton1)
                       button.append(boton2)
                       button.append(boton3)
                       button.append(boton4)
                   } else {

                       row = $('<tr class="active">')
                       .append('<td>#' + value + '</td>')
                       .append('<td style="width: 316px;"><p>' + key.Dis_Nombre + '</p></td>')
                       .append('<td><p style="margin-bottom: 0px;">' + key.corporativa + '</p><p style="margin-bottom: 0px;">' + key.gerencia + '</p><p style="margin-bottom: 0px;">' + key.uorg + '</p></td>')
                       .append('<td><p style="margin-bottom: 0px;">' + key.nomcom + '</p><p style="margin-bottom: 0px;">' + key.Dis_Fecha_Termino + '</p></td>')
                       .append('<td><p>"activo"</p></td>');

                       button = $('<div></div>')

                       boton1 = $('<a href="#" class="btn btn-primary open-test" data-disid="' + key.Dis_Id + '" data-tipo="' + key.Tip_Practica + '"style="margin-top: 0;cursor:pointer"data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-cog"></i></a>').click(function (event) {
                           //seteo datos al modal
                           $(".modal-body #nompos2").val(key.Dis_Nombre);
                           $(".modal-body #descrip2").val(key.Dis_Descripcion);
                           $(".modal-body #nomtut2").val(key.nomcom);
                           $(".modal-body #direccion2").val(key.corporativa);
                           $(".modal-body #rut2").val(key.ruteje);
                           $(".modal-body #codneg2").val(key.codneg);
                           $(".modal-body #gerencia2").val(key.gerencia);
                           $(".modal-body #unidad2").val(key.uorg);
                           $(".modal-body #datepicker3").val(key.Dis_Fecha_Inicio);
                           $(".modal-body #datepicker23").val(key.Dis_Fecha_Termino);

                           //actualizarListasCarreras(key.carreras)
                       })

                       boton2 = $('<a href="#" class="btn btn-info" id="tabgo" style="margin-top: 0; margin-left: 2px;" ><i class="glyphicon glyphicon-file"></i></a>')
                       boton3 = $('<a href="#" class="btn btn-success" style="margin-top: 0; margin-left: 2px;"><i class="glyphicon glyphicon-envelope"></i></a>')
                       boton4 = $('<a href="#" class="btn btn-danger open-test2" style="margin-top: 0; margin-left: 2px;" data-toggle="modal" data-target="#myModal2" data-disid2="' + key.Dis_Id + '"><i class="glyphicon glyphicon-thumbs-down"></i></a>');



                       button.append(boton1)
                       button.append(boton2)
                       button.append(boton3)
                       button.append(boton4)

                   }


                   row.append($('<td style="width: 186px;"></td>').append(button));
                   table.find('tbody').append(row);


               }); //fin each function  
               $('#tabla1').empty().html(table);

           }
       }); //fin done function
    } // con esta cargamos la pagina despues de alguna modificacion 




    $.ajax({
        url: "controller.asp?action=mostrarpracticaeditar",
        dataType: "json"


    })//fin ajax 
       .done(function (data) {
           var markup, table, row, button, boton1, boton2, boton3, boton4;
           if (data.success) {
               //JSON.stringify(jsonlogin[1].Dis_cod)
               //buscamos dentro de el json y lo vamos mostrando por linea y lo insertamos en el div con id example

               markup = '<table class="table table-striped table-hover">';
               markup += '  <thead>';
               markup += ' 	<tr>';
               markup += ' 		<<th>#</th>';
               markup += ' 		<th>Nombre</th>';
               markup += ' 		<th>Direccion</th>';
               markup += ' 		<th>Tutor</th>';
               markup += ' 		<th>Estado</th>';
               markup += ' 		<th>Acciones</th>';
               markup += ' 	</tr>';
               markup += ' </thead>';
               markup += ' <tbody></tbody>';
               markup += '</table>';
               table = $(markup);

               $.each(data.Practicas, function (value, key) {

                   if (key.Dis_Estado == '1') {



                       row = $('<tr class="danger">')
                       .append('<td>#' + value + '</td>')
                       .append('<td style="width: 316px;"><p>' + key.Dis_Nombre + '</p></td>')
                       .append('<td><p style="margin-bottom: 0px;">' + key.corporativa + '</p><p style="margin-bottom: 0px;">' + key.gerencia + '</p><p style="margin-bottom: 0px;">' + key.uorg + '</p></td>')
                       .append('<td><p style="margin-bottom: 0px;">' + key.nomcom + '</p><p style="margin-bottom: 0px;">' + key.Dis_Fecha_Termino + '</p></td>')
                       .append('<td><p>"inactivo"</p></td>');
                       button = $('<div></div>')

                       boton1 = $('<a href="#" class="btn btn-primary open-test" data-disid="' + key.Dis_Id + '" data-tipo="' + key.Tip_Practica + '"style="margin-top: 0;cursor:pointer"data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-cog"></i></a>').click(function (event) {
                           $(".modal-body #nompos2").val(key.Dis_Nombre);
                           $(".modal-body #descrip2").val(key.Dis_Descripcion);
                           $(".modal-body #nomtut2").val(key.nomcom);
                           $(".modal-body #direccion2").val(key.corporativa);
                           $(".modal-body #rut2").val(key.ruteje);
                           $(".modal-body #codneg2").val(key.codneg);
                           $(".modal-body #gerencia2").val(key.gerencia);
                           $(".modal-body #unidad2").val(key.uorg);
                           $(".modal-body #datepicker3").val(key.Dis_Fecha_Inicio);
                           $(".modal-body #datepicker23").val(key.Dis_Fecha_Termino);

                           //actualizarListasCarreras(key.carreras)
                       })


                       boton2 = $('<a href="#" class="btn btn-info" id="tabgo" style="margin-top: 0; margin-left: 2px;" ><i class="glyphicon glyphicon-file"></i></a>')
                       boton3 = $('<a href="#" class="btn btn-success" style="margin-top: 0; margin-left: 2px;"><i class="glyphicon glyphicon-envelope"></i></a>')
                       boton4 = $('<a href="#" class="btn btn-warning open-test3" style="margin-top: 0; margin-left: 2px;" data-toggle="modal" data-target="#myModal3" data-disid3="' + key.Dis_Id + '"><i class="glyphicon glyphicon-thumbs-up"></i></a>');
                       button.append(boton1)
                       button.append(boton2)
                       button.append(boton3)
                       button.append(boton4)
                   } else {

                       row = $('<tr class="active">')
                       .append('<td>#' + value + '</td>')
                       .append('<td style="width: 316px;"><p>' + key.Dis_Nombre + '</p></td>')
                       .append('<td><p style="margin-bottom: 0px;">' + key.corporativa + '</p><p style="margin-bottom: 0px;">' + key.gerencia + '</p><p style="margin-bottom: 0px;">' + key.uorg + '</p></td>')
                       .append('<td><p style="margin-bottom: 0px;">' + key.nomcom + '</p><p style="margin-bottom: 0px;">' + key.Dis_Fecha_Termino + '</p></td>')
                       .append('<td><p>"activo"</p></td>');

                       button = $('<div></div>')

                       boton1 = $('<a href="#" class="btn btn-primary open-test" data-disid="' + key.Dis_Id + '" data-tipo="' + key.Tip_Practica + '"style="margin-top: 0;cursor:pointer"data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-cog"></i></a>').click(function (event) {
                           //seteo datos al modal
                           $(".modal-body #disid").val(key.Dis_Id);
                           $(".modal-body #nompos2").val(key.Dis_Nombre);
                           $(".modal-body #descrip2").val(key.Dis_Descripcion);
                           $(".modal-body #nomtut2").val(key.nomcom);
                           $(".modal-body #direccion2").val(key.corporativa);
                           $(".modal-body #rut2").val(key.ruteje);
                           $(".modal-body #codneg2").val(key.codneg);
                           $(".modal-body #gerencia2").val(key.gerencia);
                           $(".modal-body #unidad2").val(key.uorg);
                           $(".modal-body #datepicker3").val(key.Dis_Fecha_Inicio);
                           $(".modal-body #datepicker23").val(key.Dis_Fecha_Termino);

                           //actualizarListasCarreras(key.carreras)
                       })

                       boton2 = $('<a href="#" class="btn btn-info" id="tabgo" style="margin-top: 0; margin-left: 2px;" ><i class="glyphicon glyphicon-file"></i></a>')
                       boton3 = $('<a href="#" class="btn btn-success" style="margin-top: 0; margin-left: 2px;"><i class="glyphicon glyphicon-envelope"></i></a>')
                       boton4 = $('<a href="#" class="btn btn-danger open-test2" style="margin-top: 0; margin-left: 2px;" data-toggle="modal" data-target="#myModal2" data-disid2="' + key.Dis_Id + '"><i class="glyphicon glyphicon-thumbs-down"></i></a>');



                       button.append(boton1)
                       button.append(boton2)
                       button.append(boton3)
                       button.append(boton4)

                   }


                   row.append($('<td style="width: 186px;"></td>').append(button));
                   table.find('tbody').append(row);


               }); //fin each function  
               $('#tabla1').empty().html(table);
           }
       }); //fin done function



    $(document).on("click", ".open-test", function () {
        var nos = $(this).data('disid');

        $(".modal-body #disid").val(nos);
    });
    $(document).on("click", ".open-test2", function () {
        var nos = $(this).data('disid2');

        $(".modal-body #disid2").val(nos);
    });


    $(document).on("click", ".open-test", function () {

        var nos = $(this).data('disid');
        $(".modal-body #disid").val(nos);
        var tipo = $(this).data('tipo');

        $('#tipopra2 option[value=' + tipo + ']').prop('selected', true);




        $.ajax({ //mostramos el total de carreras y las que estaban seleccionadas          
            url: "controller.asp?action=mostrarcarreras2",
            dataType: "json",
            data: "pracid=" + $('#disid').val() + "&tipoprac=" + $('#tipopra2').children(":selected").val()

        })//fin ajax 
    .done(function (data) {




    

        if (data.success) {
            $('#carre23').empty();
            $.each(data.Carreras2, function (value, key) {
                var html = '<option value=';
                html += key.Car_Id + '\>';
                html += key.Car_Nombre + '</option>';
                $('#carre23').append(html);

            });
            $('#carre3').empty();
            $.each(data.Carreras, function (value, key) {
                var html = '<option value=';
                html += key.Car_Id + '\>';
                html += key.Car_Nombre + '</option>';
                $('#carre3').append(html);

            });











        } //fin data succes 
    }); //fin done function



        $("#tipopra2").bind("change", function () {// cada vez que cambiamos las opciones del select del modal 

            $.ajax({
                url: "controller.asp?action=mostrarcarreras",
                dataType: "json",
                data: "tipoprac=" + $('#tipopra2').children(":selected").val()

            })//fin ajax 
    .done(function (data) {
        if (data.success) {
            $('#carre3').empty();
            $.each(data.Carreras, function (value, key) {
                var html = '<option value=';
                html += key.Car_Id + '\>';
                html += key.Car_Nombre + '</option>';
                $('#carre3').append(html);

            }); //fin each function  
        }
    }); //fin done function



        }); //fin bind

    });



    //numero de characteres restantes

    $('#descrip').on('keyup focusout paste cut', function (event) {//funcion de contador para el numero de caracteres de la descripcion
        var self = $(this);
        if (event.type == 'keyup' || event.type == 'focusout')
            $('#' + self.attr('data-CountElem')).text(self.attr('maxlength') - self.val().length);
        else if (event.type == 'paste' || event.type == 'cut') {
            setTimeout(function () {
                $('#' + self.attr('data-CountElem')).text(self.attr('maxlength') - self.val().length);
            }, 10);
        }
    });
    $('#descrip2').on('keyup focusout paste cut', function (event) {//funcion de contador para el numero de caracteres de la descripcion
        var self = $(this);
        if (event.type == 'keyup' || event.type == 'focusout')
            $('#' + self.attr('data-CountElem')).text(self.attr('maxlength') - self.val().length);
        else if (event.type == 'paste' || event.type == 'cut') {
            setTimeout(function () {
                $('#' + self.attr('data-CountElem')).text(self.attr('maxlength') - self.val().length);
            }, 10);
        }
    });

    $('#form1').validate({// validamos el form y cambiamos de estados de bootstrap    
        rules: {
            nompos: {
                minlength: 10,
                maxlength: 250,
                required: true
            },
            descrip: {
                minlength: 10,
                maxlength: 1000,
                required: true
            },
            nomtut: {
                minlength: 8,
                required: true
            },
            tipoprac: {

                required: true
            },
            carre2: {

                required: function () {
                    return this.$('#carre2 option').length == 0;
                }
            },
            datepicker: {

                required: true
            },
            datepicker2: {

                required: true
            }
        },
        highlight: function (element) {

            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');

        },
        unhighlight: function (element) {

            $(element).closest('.form-group').removeClass('has-error').addClass('has-success');

        },
        errorPlacement: function (error, element) {//hace que no se muestren los mensajes de error de jquer validate
            return true;
        },
        submitHandler: function (form) {
            var carreras = [];
            //armamos un array simple para poner los codigos de las carreras
            $('#carre2 option').each(function () {
                carreras.push($(this).val());
            });


            $.ajax({
                url: "controller.asp?action=registrar_practica",
                dataType: "json",
                data: $('form').serialize() + "&carreras=" + carreras.join("&carreras=")
            })//fin ajax
                                    .done(function (data) {

                                        if (data.success) {

                                            alert("registro exitoso")
                                        } else {

                                            alert("registro fallido")
                                        }


                                    })//fin done ajax 
                                    .fail(function (jqXHR, textStatus, errorThrown) {
                                        message = "Problema Con el Servidor";
                                        $('#btnreg').popover({ 'placement': 'top', 'content': message }).popover('show');


                                    });

            setTimeout(function () { $("#btnreg").popover('destroy'); }, 2000);
        }

    }); //fin validate form1

    $('#form2').validate({// validamos el form y cambiamos de estados de bootstrap    
        rules: {
            nompos2: {
                minlength: 10,
                maxlength: 250,
                required: true
            },
            descrip2: {
                minlength: 10,
                maxlength: 1000,
                required: true
            },
            nomtut2: {
                minlength: 8,
                required: true
            },
            tipoprac2: {

                required: true
            },
            carre23: {

                required: function () {
                    return this.$('#carre23 option').length == 0;
                }
            },
            datepicker3: {

                required: true
            },
            datepicker23: {

                required: true
            }
        },
        highlight: function (element) {

            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');

        },
        unhighlight: function (element) {

            $(element).closest('.form-group').removeClass('has-error').addClass('has-success');

        },
        errorPlacement: function (error, element) {//hace que no se muestren los mensajes de error de jquer validate
            return true;
        },
        submitHandler: function (form) {
            var carreras = [];
            //armamos un array simple para poner los codigos de las carreras
            $('#carre23 option').each(function () {
                carreras.push($(this).val());
            });


            $.ajax({
                url: "controller.asp?action=registrar_modificacion",
                dataType: "json",
                data: $('#form2').serialize() + "&carreras2=" + carreras.join("&carreras2=")
            })//fin ajax
                                    .done(function (data) {

                                        if (data.success) {

                                            alert("registro exitoso")
                                            $('#myModal').modal('hide');
                                            recargar();
                                        } else {

                                            alert("registro fallido")
                                        }


                                    })//fin done ajax 
                                    .fail(function (jqXHR, textStatus, errorThrown) {
                                        message = "Problema Con el Servidor";
                                        $('#btnreg').popover({ 'placement': 'top', 'content': message }).popover('show');


                                    });

            setTimeout(function () { $("#btnreg").popover('destroy'); }, 2000);
        }

    }); // fin validate from2






    $('#btnadd2').click(function () {//funcion agregar carrera
        $('#carre3 option:selected').each(function () {
            $('#carre23').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
            $(this).remove();
        });
    });
    $('#btndel2').click(function () {//funcion eliminar carrera 
        $('#carre23 option:selected').each(function () {
            $('#carre3').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
            $(this).remove();
        });
    });








    $('#btnadd').click(function () {//funcion agregar carrera
        $('#carre option:selected').each(function () {
            $('#carre2').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
            $(this).remove();
        });
    });
    $('#btndel').click(function () {//funcion eliminar carrera 
        $('#carre2 option:selected').each(function () {
            $('#carre').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
            $(this).remove();
        });
    });





    $(function () {//funcion para autocompletado 

        $("#nomtut").autocomplete({

            source: function (request, response) {
                $.ajax({
                    url: 'controller.asp?action=autocom',
                    dataType: "json",
                    data: { term: request.term },
                    success: function (data) {
                        result = data.reason;
                        if (data.success) {

                            $("#nomtut").popover('hide');

                            response($.map(data.Tutores, function (value, key) {
                                return {
                                    label: value.nomcom,
                                    value: value.corporativa,
                                    value2: value.gerencia,
                                    value3: value.uorg,
                                    value4: value.codneg,
                                    value5: value.matcle
                                };
                            }).slice(0, 10)); //fin response


                        } //fin if
                        else {
                            $('#nomtut').popover({ 'placement': 'bottom', 'content': result }).popover('show');
                        }
                    }, //fin done
                    error: function (jqXHR, textStatus, errorThrown) {
                        message = errorThrown;
                        $('#nomtut').popover({ 'placement': 'top', 'content': message }).popover('show');
                    }

                });
            },
            select: function (event, ui) {
                $("#nomtut").val(ui.item.label);
                $("#direccion").val(ui.item.value); //
                $("#gerencia").val(ui.item.value2); //
                $("#unidad").val(ui.item.value3); //
                $("#codneg").val(ui.item.value4); //
                $("#rut").val(ui.item.value5); //

                return false;
            },
            minLength: 3,
            max: 10
        });
    }); //fin funcion
    $(function () {//funcion para autocompletado 2
        $("#nomtut2").autocomplete({// autocomple de modal

            source: function (request, response) {
                $.ajax({
                    url: 'controller.asp?action=autocom',
                    dataType: "json",
                    data: { term: request.term },
                    success: function (data) {
                        result = data.reason;
                        if (data.success) {

                            $("#nomtut2").popover('hide');

                            response($.map(data.Tutores, function (value, key) {
                                return {
                                    label: value.nomcom,
                                    value: value.corporativa,
                                    value2: value.gerencia,
                                    value3: value.uorg,
                                    value4: value.codneg,
                                    value5: value.matcle
                                };
                            }).slice(0, 10)); //fin response


                        } //fin if
                        else {
                            $('#nomtut2').popover({ 'placement': 'bottom', 'content': result }).popover('show');
                        }
                    }, //fin done
                    error: function (jqXHR, textStatus, errorThrown) {
                        message = errorThrown;
                        $('#nomtut2').popover({ 'placement': 'top', 'content': message }).popover('show');
                    }

                });
            },
            select: function (event, ui) {
                $("#nomtut2").val(ui.item.label);
                $("#direccion2").val(ui.item.value); //
                $("#gerencia2").val(ui.item.value2); //
                $("#unidad2").val(ui.item.value3); //
                $("#codneg2").val(ui.item.value4); //
                $("#rut2").val(ui.item.value5); //

                return false;
            },
            minLength: 3,
            max: 10
        });
    }); //fin funcion autocompletado 2

    $(function () {  // funcion para mostrar carreras 
        $("#tipoprac").bind("change", function () {

            $.ajax({
                url: "controller.asp?action=mostrarcarreras",
                dataType: "json",
                data: "tipoprac=" + $(this).children(":selected").val()

            })//fin ajax 
       .done(function (data) {
           if (data.success) {
               //JSON.stringify(jsonlogin[1].Dis_cod)
               //buscamos dentro de el json y lo vamos mostrando por linea y lo insertamos en el div con id example
               $('#carre').empty();
               $.each(data.Carreras, function (value, key) {
                   var html = '<option value=';
                   html += key.Car_Id + '\>';
                   html += key.Car_Nombre + '</option>';
                   $('#carre').append(html);

               }); //fin each function  
           }
       }); //fin done function
        }); //fin bind
    }); //fin funcion

    //cambiar idioma datepicker   
    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);
    //fin cambiar idioma y region datepicker     


    $("#btnreg").click(function () {
        $("#btnreg").popover('destroy');


    }); //fin btnreg function





});                 // fin document ready