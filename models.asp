<!--#include virtual="/assets/aspJSON/1.17/aspJSON.asp"-->
<!--#include virtual="/assets/helpers.asp"-->
<!--#include file="conection.asp"-->
<!--#include file="db.asp"-->
<%
 Function activapractica(activa)   
                                     Set oJSON = New aspJSON
	                                'On Error Resume Next
	                                Pruebas_BD.Open()
	                                If Err.Number = 0 Then
				                              

				                                Set rs = activapracticas(activa)
                                         
				                                If Err.Number = 0 Then
			
			                                     oJSON.data("success") = True
                                                 else
                                                 message = "Ocurrió un error. Al intentar incertar los datos"
                                                 End If
		                                
	                                Else
		                                message = "Ocurrió un error. Intenta nuevamente"
	                                End If   'end if error.Number
                                                                                                                                                                                                                                                    
                                  

            If message <> "" Then
		        oJSON.data("success") = False
		        oJSON.data("reason") = message
	        End If
	        activapractica = oJSON.JSONoutput()
	        Pruebas_BD.Close()

End Function 

Function deshabilita_practica(desa)

                                    Set oJSON = New aspJSON
	                                'On Error Resume Next
	                                Pruebas_BD.Open()
	                                If Err.Number = 0 Then
				                              

				                                Set rs = deshabilitapractica(desa)
                                         
				                                If Err.Number = 0 Then
			
			                                     oJSON.data("success") = True
                                                 else
                                                 message = "Ocurrió un error. Al intentar incertar los datos"
                                                 End If
		                                
	                                Else
		                                message = "Ocurrió un error. Intenta nuevamente"
	                                End If   'end if error.Number
                                                                                                                                                                                                                                                    
                                  

            If message <> "" Then
		        oJSON.data("success") = False
		        oJSON.data("reason") = message
	        End If
	        deshabilita_practica = oJSON.JSONoutput()
	        Pruebas_BD.Close()               

End Function
    
Function mostrarpracticaeditar()

    Set oJSON = New aspJSON
	'On Error Resume Next
   
	Pruebas_BD.Open()
	If Err.Number = 0 Then
				
				Set rs = mostrar_practicaeditar()
				If Not rs.Eof Then
					Set oJSON.data("Practicas") = oJSON.Collection()
					Do While Not rs.Eof
						Id = rs("Dis_Id")
                        Nombre = rs("Dis_Nombre")
                        descrip = rs("Dis_Descripcion")
                        fecht = rs("Dis_Fecha_Termino")
                        nomcom = rs("nomcom")
                        matcle = rs("matcle")
                        corpo = rs("corporativa")
                        gere = rs("gerencia")
                        uorg = rs("uorg")
                        fechi = rs("Dis_Fecha_Inicio")'***
                        codneg = rs("codneg")'***
                        tip = rs("Tip_Practica")
                         rut = rs("ruteje")'***
                         estado = rs("Dis_Estado")'***
                                           						
						Set typeItem = oJSON.AddToCollection(oJSON.data("Practicas"))
						typeItem.add "Dis_Id", Id
						typeItem.add "Dis_Nombre", Nombre
                        typeItem.add "Dis_Descripcion", descrip
                        typeItem.add "Dis_Fecha_Termino", fecht
                        typeItem.add "nomcom", nomcom
                        typeItem.add "matcle", matcle
                        typeItem.add "corporativa", corpo
                        typeItem.add "gerencia", gere
                        typeItem.add "uorg", uorg
                        typeItem.add "Dis_Fecha_Inicio", fechi
                        typeItem.add "codneg", codneg
                        typeItem.add "Tip_Practica", tip
                        typeItem.add "ruteje",rut
                         typeItem.add "Dis_Estado",estado


                       
						rs.MoveNext
					Loop
				End If
			
			oJSON.data("success") = True
		
	Else
		message = "Ocurrió un error. Intenta nuevamente"
	End If
	If message <> "" Then
		oJSON.data("success") = False
		oJSON.data("reason") = message
	End If
	mostrarpracticaeditar = oJSON.JSONoutput()
	Pruebas_BD.Close()



End Function 






 Function mostrar_carreras(tipoprac) 'funcion para mostrar carreras 
 Set oJSON = New aspJSON
	'On Error Resume Next
	Pruebas_BD.Open()
	If Err.Number = 0 Then
				
				Set rs = mosCarreras(tipoprac)
				If Not rs.Eof Then
					Set oJSON.data("Carreras") = oJSON.Collection()
					Do While Not rs.Eof
						Car_Nombre = rs("Car_Nombre")
                        Car_Id = rs("Car_Id")                    						
						Set typeItem = oJSON.AddToCollection(oJSON.data("Carreras"))
						typeItem.add "Car_Nombre", Car_Nombre
						typeItem.add "Car_Id", Car_Id
                       
						rs.MoveNext
					Loop
				End If
			
			oJSON.data("success") = True
		
	Else
		message = "Ocurrió un error. Intenta nuevamente"
	End If
	If message <> "" Then
		oJSON.data("success") = False
		oJSON.data("reason") = message
	End If
	mostrar_carreras = oJSON.JSONoutput()
	Pruebas_BD.Close()
 
End Function  






 Function mostrar_carreras2(pracid,tipoprac) 'funcion para mostrar carreras pre seleccionadas para el modal
 Set oJSON = New aspJSON
	'On Error Resume Next
	Pruebas_BD.Open()
	If Err.Number = 0 Then
				
				Set rs = mosCarreras2(pracid)
				If Not rs.Eof Then
					Set oJSON.data("Carreras2") = oJSON.Collection()
					Do While Not rs.Eof
						Car_Nombre = rs("Car_Nombre")
                        Car_Id = rs("Car_Id")                    						
						Set typeItem = oJSON.AddToCollection(oJSON.data("Carreras2"))
						typeItem.add "Car_Nombre", Car_Nombre
						typeItem.add "Car_Id", Car_Id
                       
						rs.MoveNext
					Loop
				End If
                Set rs = mosCarreras(tipoprac)
				If Not rs.Eof Then
					Set oJSON.data("Carreras") = oJSON.Collection()
					Do While Not rs.Eof
						Car_Nombre = rs("Car_Nombre")
                        Car_Id = rs("Car_Id")                    						
						Set typeItem = oJSON.AddToCollection(oJSON.data("Carreras"))
						typeItem.add "Car_Nombre", Car_Nombre
						typeItem.add "Car_Id", Car_Id
                       
						rs.MoveNext
					Loop
				End If
               
			
			oJSON.data("success") = True
		
	Else
		message = "Ocurrió un error. Intenta nuevamente"
	End If
	If message <> "" Then
		oJSON.data("success") = False
		oJSON.data("reason") = message
	End If
	mostrar_carreras2 = oJSON.JSONoutput()
	Pruebas_BD.Close()
 
End Function 


        Function autocomple(term)' funcion para mostrarlos resultados de el autocomplete
    
     

	        Set oJSON = New aspJSON
	        'On Error Resume Next
	        Pruebas_BD.Open()
	        If Err.Number = 0 Then
				
				        Set rs = getTutores(term)
				        If Not rs.Eof Then
					        Set oJSON.data("Tutores") = oJSON.Collection()
					        Do While Not rs.Eof
						        nomcom = rs("nomcom")
                                corporativa = rs("corporativa")
                                gerencia = rs("gerencia")
                                uorg = rs("uorg")
                                codneg = rs("codneg")
                                matcle = rs("matcle")
						
						        Set typeItem = oJSON.AddToCollection(oJSON.data("Tutores"))
						        typeItem.add "nomcom", nomcom
						        typeItem.add "corporativa", corporativa
                                typeItem.add "gerencia", gerencia
                                typeItem.add "uorg", uorg
                                typeItem.add "codneg", codneg
                                typeItem.add "matcle", matcle
						        rs.MoveNext
					        Loop
                         else 
                         message = "No se encontro a nadie con estos datos"

				        End If 'End if Eof
			
			        oJSON.data("success") = True
		
	        Else
		        message = "Ocurrió un error. Intenta nuevamente"
	        End If   'end if error.Number
	        If message <> "" Then
		        oJSON.data("success") = False
		        oJSON.data("reason") = message
	        End If
	        autocomple = oJSON.JSONoutput()
	        Pruebas_BD.Close()
    
  
        End Function


        Function registrar_practica(nom,des,codneg,rut,fechini,fechter,tipo)'funcion para registrar una disponibilidad de una practica


        If len(nom) <= 250 Then         
            If len(des) <= 1000 Then 
                If len(codneg) <= 25 Then 
                    If len(rut) <= 10 Then                          
                            If IsDate(fechini) Then 
                                If IsDate(fechter) Then 
                                    If len(Tipo) <= 5 Then

                                    Set oJSON = New aspJSON
	                                'On Error Resume Next
	                                Pruebas_BD.Open()
	                                If Err.Number = 0 Then
				                              

				                                Set rs = insertPractica(nom,des,codneg,rut,fechini,fechter,tipo)
                                         Do While Not rs.Eof       
                                                id = rs("Dis_Id")

                                                 rs.MoveNext
					                      Loop
                                                 
                                                  carrerastotal = Request("carreras").Count

                                               For i=1 to carrerastotal
                                                        carrera = Request("carreras")(i)
                                                        Set rss = insertRelacionPractica(carrera,id)
                                               next 
                                               
				                                If Err.Number = 0 Then
			
			                                     oJSON.data("success") = True
                                                 else
                                                 message = "Ocurrió un error. Al intentar incertar los datos"
                                                 End If
		                                
	                                Else
		                                message = "Ocurrió un error. Intenta nuevamente"
	                                End If   'end if error.Number
                                                                                                                                                                                                                                                    
                                    Else message = "Ocurrió un error. Intenta nuevamente" END IF'tipo
                                Else message = "Ocurrió un error. Intenta nuevamente" END IF'fechter
                            Else message = "Ocurrió un error. Intenta nuevamente" END IF'fechini
                    Else message = "Ocurrió un error. Intenta nuevamente" END IF'rut
                Else message = "Ocurrió un error. Intenta nuevamente" END IF'codneg
            Else message = "Ocurrió un error. Intenta nuevamente" END IF'des
        Else message = "Ocurrió un error. Intenta nuevamente" END IF 'nom

            If message <> "" Then
		        oJSON.data("success") = False
		        oJSON.data("reason") = message
	        End If
	        registrar_practica = oJSON.JSONoutput()
	        Pruebas_BD.Close()

                 


        End Function



        Function registrarmodificacion(id,nom2,des2,codneg2,rut2,fechini2,fechter2,tipo2)

          If len(nom2) <= 250 Then         
            If len(des2) <= 1000 Then 
                If len(codneg2) <= 25 Then 
                    If len(rut2) <= 10 Then                          
                            If IsDate(fechini2) Then 
                                If IsDate(fechter2) Then 
                                    If len(Tipo2) <= 5 Then

                                    Set oJSON = New aspJSON
	                                'On Error Resume Next
	                                Pruebas_BD.Open()
	                                If Err.Number = 0 Then
				                              

				                                Set rs = updatemodificacion(id,nom2,des2,codneg2,rut2,fechini2,fechter2,tipo2)
                       
                                                 
                                                  carrerastotal = Request("carreras2").Count

                                               For i=1 to carrerastotal
                                                        carrera = Request("carreras2")(i)
                                                        Set rss = insertRelacionPractica(carrera,id)
                                               next 
                                               
				                                If Err.Number = 0 Then
			
			                                     oJSON.data("success") = True
                                                 else
                                                 message = "Ocurrió un error. Al intentar incertar los datos"
                                                 End If
		                                
	                                Else
		                                message = "Ocurrió un error. Intenta nuevamente"
	                                End If   'end if error.Number
                                                                                                                                                                                                                                                    
                                    Else message = "Ocurrió un error. Intenta nuevamente" END IF'tipo
                                Else message = "Ocurrió un error. Intenta nuevamente" END IF'fechter
                            Else message = "Ocurrió un error. Intenta nuevamente" END IF'fechini
                    Else message = "Ocurrió un error. Intenta nuevamente" END IF'rut
                Else message = "Ocurrió un error. Intenta nuevamente" END IF'codneg
            Else message = "Ocurrió un error. Intenta nuevamente" END IF'des
        Else message = "Ocurrió un error. Intenta nuevamente" END IF 'nom

            If message <> "" Then
		        oJSON.data("success") = False
		        oJSON.data("reason") = message
	        End If
	       registrarmodificacion = oJSON.JSONoutput()
	        Pruebas_BD.Close()



        End Function 
%>