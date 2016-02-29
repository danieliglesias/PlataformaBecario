
<%
Function deshabilitapractica(desa)
Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "deshabilitarpractica"
        .Parameters.Append .CreateParameter("@id", 3, 1, , ""&desa)  
		.CommandType = 4
		Set deshabilitapractica = .Execute
	End With

End Function   

Function activapracticas(activa)
Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "activapractica"
        .Parameters.Append .CreateParameter("@id", 3, 1, , ""&activa)  
		.CommandType = 4
		Set activapracticas = .Execute
	End With


End Function  

Function mostrar_practicaeditar()
    Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "mostrarpracticaeditar"
		.CommandType = 4
		Set mostrar_practicaeditar = .Execute
	End With
End Function 

Function mostrar_practicaeditar2(pracid) 
    Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "mostrarpracticaeditar2"
        .Parameters.Append .CreateParameter("@id", 3, 1, , ""&pracid)
		.CommandType = 4
		Set mostrar_practicaeditar2 = .Execute
	End With
End Function   


Function getTutores(term)

	Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "auto_complete"
		.Parameters.Append .CreateParameter("@term", 200, 1, 20, ""&term)
		.CommandType = 4
		Set getTutores = .Execute
	End With
End Function


Function mosCarreras(tipoprac)

    Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "mostrar_carreras"
		.Parameters.Append .CreateParameter("@tipopractica", 200, 1, 5, ""&tipoprac)
		.CommandType = 4
		Set mosCarreras = .Execute
	End With

End Function

Function mosCarreras2(pracid)

    Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "mostrar_carreras2"
		.Parameters.Append .CreateParameter("@tipopractica", 200, 1, 5, ""&pracid)
		.CommandType = 4
		Set mosCarreras2 = .Execute
	End With

End Function
Function updatemodificacion(id,nom2,des2,codneg2,rut2,fechini2,fechter2,tipo2)
 Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "update_practica"
		.Parameters.Append .CreateParameter("@nom", 200, 1, 250, ""&nom2)
        .Parameters.Append .CreateParameter("@des", 200, 1, 1000, ""&des2)
        .Parameters.Append .CreateParameter("@codneg", 129, 1, 25, ""&codneg2)
        .Parameters.Append .CreateParameter("@rut", 129, 1, 10, ""&rut2)
        .Parameters.Append .CreateParameter("@fechini", 7, 1, 0, ""&fechini2)
        .Parameters.Append .CreateParameter("@fechter", 7, 1, 0, ""&fechter2)
        .Parameters.Append .CreateParameter("@tipo", 200, 1, 5, ""&tipo2)
        .Parameters.Append .CreateParameter("@id", 3, 1, , ""&id)
		.CommandType = 4
		Set updatemodificacion = .Execute
	End With


End Function
Function insertPractica(nom,des,codneg,rut,fechini,fechter,tipo)
    
    Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "registrar_practica"
		.Parameters.Append .CreateParameter("@nom", 200, 1, 250, ""&nom)
        .Parameters.Append .CreateParameter("@des", 200, 1, 1000, ""&des)
        .Parameters.Append .CreateParameter("@codneg", 129, 1, 25, ""&codneg)
        .Parameters.Append .CreateParameter("@rut", 129, 1, 10, ""&rut)
        .Parameters.Append .CreateParameter("@fechini", 7, 1, 0, ""&fechini)
        .Parameters.Append .CreateParameter("@fechter", 7, 1, 0, ""&fechter)
        .Parameters.Append .CreateParameter("@tipo", 200, 1, 5, ""&tipo)
		.CommandType = 4
		Set insertPractica = .Execute
	End With

End Function



Function insertRelacionPractica(carrera,id)
    
    Set cmd = Server.CreateObject("ADODB.Command")
	With cmd
		.ActiveConnection = Pruebas_BD
		.CommandText = "insert_relacion_practia"
		.Parameters.Append .CreateParameter("@carrera", 3, 1, , ""&carrera)
        .Parameters.Append .CreateParameter("@id", 3, 1, , ""&id)      
		.CommandType = 4
		Set insertRelacionPractica = .Execute
	End With

End Function


%>