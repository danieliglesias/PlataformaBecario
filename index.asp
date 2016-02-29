
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link href="css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="css/style.css" rel="stylesheet">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>               
        <script src="js/jquery.validate.min.js"></script>
         
        <script src="js/scripts.js"></script>
         <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
   $(function() {
    $( "#datepicker2" ).datepicker();
  });
  $(function() {
    $( "#datepicker3" ).datepicker();
  });
  $(function() {
    $( "#datepicker23" ).datepicker();
  });
 
  </script>

        <title>Test jquery Ajax asp Json</title>
    </head>
    <body>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
            <div class="col-md-8">
                <div id="header"></div>

            </div>
        <div class="col-md-2"></div>
    </div>
</div>



<div>
<div class="row" id="nav">
<div class="col-md-2"></div>
<div class="col-md-8">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist" id="tabs">
    <li role="presentation" class="active"><a id="hometab"href="#tabs-1" role="tab" data-toggle="tab" >Ingreso Disponibilidad</a></li>
    <li role="presentation"><a id="distab"href="#tabs-2" role="tab" data-toggle="tab">Ver Disponibilidad</a></li>
    <li role="presentation"><a id="usertab"href="#tabs-3" role="tab" data-toggle="tab">En Proceso</a></li>
    
  </ul>
</div>
<div class="col-md-2"></div>
</div>
  <!-- Tab panes -->
  <div class="tab-content">
  <!-- _______________________________________________________________________________-->

    <div role="tabpanel" class="tab-pane active" id="tabs-1">
        <div class="row">
            <div class="col-md-2" id="colhidden"></div>
                <div class="col-md-8" id="colnohidden">
                    

                    <form id="form1">
                       
                           <div class="form-group has-feedback">
                            <label for="Nombrepostulacion">Nombre Cupo Práctica</label>
                            <input class="form-control input" id="nompos" name="nompos"placeholder="Escribir nombre..."maxlength="250">
                          </div>
                          <div class="form-group has-feedback">
                            <label for="descrip">Descripción Práctica</label>
                            <textarea class="text form-control" rows="3" id="descrip" name="descrip" placeholder="Escribir Descripción"maxlength="1000"  data-CountElem="InputCharCount2"></textarea>
                              caracteres restantes <span id="InputCharCount2" class="CharCounter">1000</span>
                          </div>
                        <div class="row">
                            <div class="col-md-2">
                        <label>Nombre Tutor: </label>
                                </div>
                            <div class="form-group has-feedback col-md-10">
                         <input id="nomtut" name="nomtut"class="form-control" placeholder="Buscar...">
                                </div>
                         </div>
                        <div class="row">
                            <div class="col-md-2">
                         <label>Dirección: </label>
                                </div>
                             <div class="col-md-10">
                            <input type="text" class="form-control" id="direccion" placeholder="Dirección..." disabled>
                                 </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                         <label>Gerencia: </label>
                                </div>
                             <div class="col-md-10">
                            <input type="text" class="form-control" id="gerencia" placeholder="Gerencia..." disabled>
                                 </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                         <label>Unidad: </label>
                                </div>
                            <div class="col-md-10">
                            <input type="text" class="form-control" id="unidad" placeholder="Unidad..." disabled>
                                </div>
                        </div>
                        <input type="hidden" id="codneg" name="codneg">
                        <input type="hidden" id="rut" name="rut">
                        <div class="row">
                            <div class="col-md-2">
                          <label>Tipo Practica: </label>
                                </div>
                            <div class="col-md-10">
                                <div class="form-group has-feedback">
                          <select class="form-control" id="tipoprac" name="tipoprac" >
                              <option value="">Selecciona una opción</option>
                            <option value="TEC">TECNICO</option>
                            <option value="PRO">PROFESIONAL</option>
                            <option value="TPR">TECNICO PROFECIONAL</option>
                          </select>
                                    </div>
                                </div>
                        </div>

                        
                            <div class="row">
                                <div class="col-md-6">
                                            <select multiple class="form-control" id="carre"></select>
                                    </div>
                                <div align="center" class="col-md-1">
                                    <div class="row">
                                                <button type="button" class="btn btn-success" id="btnadd" aria-label="Left Align">+</button>
                                        </div>
                                    <div class="row">
                                                <button type="button" class="btn btn-danger" id="btndel"aria-label="Left Align">-</button>
  

                                        </div>
                                    </div>
                                <div class="form-group has-feedback col-md-5">
                                           <select multiple class="mySelect form-control" id="carre2" name="carre2"></select>
                                    </div>
                            </div>
                      
                        
                        <div class="row">
                            <div class="col-md-2">
                        <label>Fecha Inicio: </label>
                                </div>
                            <div class="form-group has-feedback col-md-8">
                            <input type="text"class="form-control" id="datepicker" name="datepicker" readonly>
                                </div>
                             <div class="col-md-2"></div>
                                </div>
                       <div class="row">
                            <div class="col-md-2">
                        <label>Fecha Termino: </label>
                                </div>
                            <div class="form-group has-feedback col-md-8">
                            <input type="text"class="form-control" id="datepicker2" name="datepicker2" readonly>
                                </div>
                           <div class="col-md-2"></div>
                                </div>
                        
                                  <button type="submit" id="btnreg"class="btn btn-primary btn-lg btn-block">Crear</button>
                    </form>
                   


                </div>
            <div class="col-md-2" id="colhidden"></div>
        </div>
    </div><!-- Fin home content-->
     
    <!-- _______________________________________________________________________________-->
    <div role="tabpanel" class="tab-pane" id="tabs-2">

            <div class="row">
                <div class="col-md-1" id="colhidden"></div>
                <div class="col-md-10" id="colnohidden">
                    
                  <div class="table-responsive" id="tabla1">
               
                </div>
                </div>
                <div class="col-md-1" id="colhidden"></div>
            </div>
        
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" style="text-align : center">Modificación</h4>
      </div>
      <div class="modal-body">
       
           <form id="form2">
               <div class="form-group">
                            <input type="hidden" class="form-control" id="disid" name="disid"> 
                   </div>   
                           <div class="form-group has-feedback">
                            <label for="Nombrepostulacion">Nombre Cupo Práctica</label>
                            <input class="form-control input" id="nompos2" name="nompos2"maxlength="250">
                          </div>
                          <div class="form-group has-feedback">
                            <label for="descrip">Descripción Práctica</label>
                            <textarea class="text form-control" rows="3" id="descrip2" name="descrip2" placeholder="Escribir Descripción"maxlength="1000"  data-CountElem="InputCharCount3"></textarea>
                              caracteres restantes <span id="InputCharCount3" class="CharCounter">1000</span>
                          </div>
                        <div class="row">
                            <div class="col-md-2">
                        <label>Nombre Tutor: </label>
                                </div>
                            <div class="form-group has-feedback col-md-10">
                         <input id="nomtut2" name="nomtut2"class="form-control" placeholder="Buscar...">
                                </div>
                         </div>
                        <div class="row">
                            <div class="col-md-2">
                         <label>Dirección: </label>
                                </div>
                             <div class="col-md-10">
                            <input type="text" class="form-control" id="direccion2" placeholder="Dirección..." disabled>
                                 </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                         <label>Gerencia: </label>
                                </div>
                             <div class="col-md-10">
                            <input type="text" class="form-control" id="gerencia2" placeholder="Gerencia..." disabled>
                                 </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                         <label>Unidad: </label>
                                </div>
                            <div class="col-md-10">
                            <input type="text" class="form-control" id="unidad2" placeholder="Unidad..." disabled>
                                </div>
                        </div>
                        <input type="hidden" id="codneg2" name="codneg2">
                        <input type="hidden" id="rut2" name="rut2">
                        <div class="row">
                            <div class="col-md-2">
                          <label>Tipo Practica: </label>
                                </div>
                            <div class="col-md-10">
                                <div class="form-group has-feedback">
                          <select class="form-control" id="tipopra2" name="tipoprac2" >
                              <option value="">Selecciona una opción</option>
                            <option value="TEC">TECNICO</option>
                            <option value="PRO">PROFESIONAL</option>
                            <option value="TPR">TECNICO PROFECIONAL</option>
                          </select>
                                    </div>
                                </div>
                        </div>

                        
                            <div class="row">
                                <div class="col-md-6">
                                            <select multiple class="form-control" id="carre3"></select>
                                    </div>
                                <div align="center" class="col-md-1">
                                    <div class="row">
                                                <button type="button" class="btn btn-success" id="btnadd2" aria-label="Left Align">+</button>
                                        </div>
                                    <div class="row">
                                                <button type="button" class="btn btn-danger" id="btndel2"aria-label="Left Align">-</button>
  

                                        </div>
                                    </div>
                                <div class="form-group has-feedback col-md-5">
                                           <select multiple class="mySelect form-control" id="carre23" name="carre23"></select>
                                    </div>
                            </div>
                      
                        
                        <div class="row">
                            <div class="col-md-2">
                        <label>Fecha Inicio: </label>
                                </div>
                            <div class="form-group has-feedback col-md-8">
                            <input type="text"class="form-control datepicker" id="datepicker3" name="datepicker3" readonly>
                                </div>
                             <div class="col-md-2"></div>
                                </div>
                       <div class="row">
                            <div class="col-md-2">
                        <label>Fecha Termino: </label>
                                </div>
                            <div class="form-group has-feedback col-md-8">
                            <input type="text"class="form-control datepicker" id="datepicker23" name="datepicker23" readonly>
                                </div>
                           <div class="col-md-2"></div>
                                </div>
                        
                                  <button type="submit" id="btnreg"class="btn btn-primary btn-lg btn-block">Modificar</button>
                    </form>



      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-sm modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" style="text-align : center">Deshabilitar</h4>
      </div>
      <div class="modal-body">
     <form id="form3">
         <h4 style="text-align : center">¿Estas Seguro Que quieres deshabilitar esta Practica? </h4>
               <div class="form-group">
                            <input type="hidden" class="form-control" id="disid2" name="disid2"> 
                   </div>
         <button type="button" id="btnreg2"class="btn btn-primary btn-sm btn-block">DESHABILITAR</button>
         </form>
          
          



      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-sm modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" style="text-align : center">Reactivar</h4>
      </div>
      <div class="modal-body">
     <form id="form3">
         <h4 style="text-align : center">¿Estas Seguro Reactivar esta Practica? </h4>
               <div class="form-group">
                            <input type="hidden" class="form-control" id="disid3" name="disid2"> 
                   </div>
         <button type="button" id="btnreg3"class="btn btn-primary btn-sm btn-block">REACTIVAR</button>
         </form>
          
        
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
        


     
    </div><!-- Fin dispo -->
    <!-- _______________________________________________________________________________-->
    <div role="tabpanel" class="tab-pane" id="tabs-3">

        <div class="row">
                <div class="col-md-1" id="colhidden"></div>
                <div class="col-md-10" id="colnohidden">
                    
                  <div class="table-responsive">
                  <table class="table table-striped table-hover">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Nombre Postulante</th>
                        <th>Dirección</th>
                        <th>Tutor</th>
                        <th>Costo</th>
                        <th>Estado</th>
                        <th>Acciones</th>
          
                      </tr>
                    </thead>
                    <tbody id="tablas">
      
        
                    </tbody>
                  </table>
                </div>
                </div>
                <div class="col-md-1" id="colhidden"></div>
            </div>
    </div><!--fin tab users-->
</div><!--Fin tab content-->

</div><!--Fin tab div-->



    </body>
</html>
