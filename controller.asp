<!--#include file="models.asp"-->

<% 
Response.CodePage = 65001 'UTF-8
Response.Charset = "UTF-8"
Response.ContentType = "application/json"
'la accion que define que hacer en el case de abajo
action = Request.QueryString("action") 'GET
'variable que forma los resultados del autocomplete
term = Request.QueryString("term") 'GET
'variable para mostrar las carreras 
    tipoprac = Request.QueryString("tipoprac") 'GET
'variables para el registro de practica
     nom = Request.QueryString("nompos") 'GET       
        des = Request.QueryString("descrip") 'GET
            codneg = Request.QueryString("codneg") 'GET
                 rut = Request.QueryString("rut") 'GET                    
                     fechini = Request.QueryString("datepicker") 'GET
                          fechter = Request.QueryString("datepicker2") 'GET
                              
     nom2 = Request.QueryString("nompos2") 'GET
        pracid2 = Request.QueryString("pracid2") 'GET
            des2 = Request.QueryString("descrip2") 'GET
                codneg2 = Request.QueryString("codneg2") 'GET
                    rut2 = Request.QueryString("rut2") 'GET                    
                        fechini2 = Request.QueryString("datepicker3") 'GET
                            fechter2 = Request.QueryString("datepicker23") 'GET
                                tipo2 = Request.QueryString("tipoprac2") 'GET
                                    pracid = Request.QueryString("pracid") 'GET
                                        id = Request.QueryString("disid") '
                                            desa = Request.QueryString("desabilita") 'GET
                                                activa = Request.QueryString("activa") 'GET
                                    

  
      Select Case action
        Case "activa_practica"
                 
                result =activapractica(activa)
      
        Case "mostrarpracticaeditar"
            
            result= mostrarpracticaeditar()

        Case "deshabilita_practica"
            result=deshabilita_practica(desa)

		Case "registrar_modificacion"
            
            result= registrarmodificacion(id,nom2,des2,codneg2,rut2,fechini2,fechter2,tipo2)
        Case "autocom"

			result= autocomple(term)
            
        Case "mostrarcarreras"

			result= mostrar_carreras(tipoprac)
        Case "mostrarcarreras2"

			result= mostrar_carreras2(pracid,tipoprac)

        Case "registrar_practica"

            result= registrar_practica(nom,des,codneg,rut,fechini,fechter,tipo)
            
		Case Else
			message = "La petición no es válida"
	End Select
                
     


Response.Write(result)

%>

