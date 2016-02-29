<%
key = "~}|{zyah'p"
Base64Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"&_
				"abcdefghijklmnopqrstuvwxyz"&_
				"0123456789"&_
				"+/"

Function FormatID(id)
	FormatID = Replace(FormatNumber(CLng(  Left(id, Len(id) - 1)  ), 0), ",", ".")&"-"&UCase(Right(id, 1))
End Function

Function formatPhoneNumber(phone_number)
	If Len(phone_number) = 8 Then formatPhoneNumber = "+569"&phone_number Else formatPhoneNumber = ""
End Function

Function getCookieExpirationDate(days)
	expiration_date = Now() + days
	getCookieExpirationDate = ""&_
		WeekDayName(WeekDay(expiration_date), True)&", "&_
		Right("0"&Day(expiration_date), 2)&"-"&_
		MonthName(Month(expiration_date), True)&"-"&_
		Year(expiration_date)&" "&_
		DatePart("h", expiration_date)&":"&_
		DatePart("n", expiration_date)&":"&_
		DatePart("s", expiration_date)&" GMT"
End Function

Function isIdValid(id)
	Set idExpReg = New RegExp
	With idExpReg
	  .Pattern = "^0*(\d{1,3}(\.?\d{3})*)\-?([\dkK])$"
	  .Global = False
	End With
	If idExpReg.Test(id) Then
		times = 2
		sum = 0
		vd = LCase(CStr(Right(id, 1)))
		chain = StrReverse(CStr(CLng(Mid(id, 1, (Len(id) - 1)))))
		For counter = 1 To Len(chain)
			sum = sum + (CInt(Mid(chain, counter, 1)) * times)
			If times = 7 Then times = 2 Else times = times + 1
		Next
		digit = CStr(11 - (sum Mod 11))
		If digit = "10" Then digit = "k"
    	If digit = "11" Then digit = "0"
		If digit = vd Then
			isIdValid = True
		Else
			isIdValid = False
		End If
	Else
		isIdValid = False
	End If
End Function

Function isProcessIdValid(process_id)
	If process_id <> "" Then
		If IsNumeric(process_id) Then
			process_id = CStr(CLng(process_id))
			If Len(process_id) <= 10 And Len(process_id) >= 8 Then
				isProcessIdValid = True
			Else
				isProcessIdValid = False
			End If
		Else
			isProcessIdValid = False
		End If
	Else
		isProcessIdValid = False
	End If
End Function

Function isBusinessCodeValid(business_code)
	If IsNumeric(business_code) And Len(business_code) = 25 And business_code > 0 Then isBusinessCodeValid = True Else isBusinessCodeValid = False
End Function

Function isEmailValid(email) 
    Set regEx = New RegExp 
	regEx.Pattern = "^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w{2,}$" 
	isEmailValid = regEx.Test(Trim(email)) 
End Function

Function isPeriodValid(period)
	isPeriodValid = True 'fix this
End Function

Function isInArray(element, arr)
  	isInArray = False
  	For i = 0 To Ubound(arr)
		If Trim(arr(i)) = Trim(element) Then
			isInArray = True
			Exit Function
		End If
	Next
End Function

Function isArrayNumeric(arr)
	isArrayNumeric = True
	For i = 0 To Ubound(arr)
		If Not IsNumeric(arr(i)) Or IsEmpty(arr(i)) Then
			isArrayNumeric = False
			Exit Function
		End If
	Next
End Function

Function isLong(n)
	isLong = False
	If IsNumeric(n) And Not IsEmpty(n) Then
		If n >= -2147483648 And n <= 2147483647 Then isLong = True
	End If
End Function

Function isInt(n)
	isInt = False
	If IsNumeric(n) And Not IsEmpty(n) Then
		If n >= -32768 And n <= 32767 Then isInt = True
	End If
End Function

Function Codifica(strClave)
 	Dim iKeyChar, iClaveChar, iCodiChar, strSql, x
	For i = 1 To Len(strClave)
		If i > Len(key) Then
			x = (i Mod Len(key)) + 1
			iKeyChar = Asc(Mid(key, x, 1))
		Else
			iKeyChar = Asc(Mid(key, i, 1))
		End If
		iClaveChar = Asc(Mid(strClave, i, 1))
		iCodiChar = iKeyChar Xor iClaveChar
		strSql = strSql & iCodiChar & "."
	Next
	Codifica = strSql
End Function

Function Decodifica(ClaveSql)
	Dim salida, valor, Temp, iKeyChar, iClaveChar, strDecodificado, iCodiChar, x	
	salida = ""
	valor = ClaveSql
	Do While(valor <> "" And Instr(valor,".") <> 0)
		Temp = Left(valor, Instr(valor, ".") - 1)
		valor = Right(valor, Len(valor) - Instr(valor, "."))
		salida = salida & Chr(Temp)
	Loop
	For i = 1 to Len(salida)
		If i > Len(key) Then
			x = (i mod Len(key)) + 1
			iKeyChar = Asc(Mid(key, x, 1))
		Else
			iKeyChar = Asc(Mid(key, i, 1))
		End If	
		iClaveChar = Asc(Mid(salida, i, 1))
		iCodiChar = iKeyChar Xor iClaveChar
		strDecodificado =  strDecodificado & Chr(iCodiChar)
	Next
	Decodifica = strDecodificado
End Function

Public Function EncodeStr(byVal strIn)
	Dim c1, c2, c3, w1, w2, w3, w4, n, strOut
	For n = 1 To Len(strIn) Step 3
		c1 = Asc(Mid(strIn, n, 1))
		c2 = Asc(Mid(strIn, n + 1, 1) + Chr(0))
		c3 = Asc(Mid(strIn, n + 2, 1) + Chr(0))
		w1 = Int(c1 / 4) : w2 = (c1 And 3) * 16 + Int(c2 / 16)
		If Len(strIn) >= n + 1 Then 
			w3 = (c2 And 15) * 4 + Int(c3 / 64) 
		Else 
			w3 = -1
		End If
		If Len(strIn) >= n + 2 Then 
			w4 = c3 And 63 
		Else 
			w4 = -1
		End If
		strOut = strOut + mimeencode(w1) + mimeencode(w2) + _
				  mimeencode(w3) + mimeencode(w4)
	Next
	EncodeStr = strOut
End Function

Private Function mimedecode(byVal strIn)
	If Len(strIn) = 0 Then 
		mimedecode = -1 : Exit Function
	Else
		mimedecode = InStr(Base64Chars, strIn) - 1
	End If
End Function

Public Function DecodeStr(byVal strIn)
	Dim w1, w2, w3, w4, n, strOut
	For n = 1 To Len(strIn) Step 4
		w1 = mimedecode(Mid(strIn, n, 1))
		w2 = mimedecode(Mid(strIn, n + 1, 1))
		w3 = mimedecode(Mid(strIn, n + 2, 1))
		w4 = mimedecode(Mid(strIn, n + 3, 1))
		If w2 >= 0 Then _
			strOut = strOut + _
				Chr(((w1 * 4 + Int(w2 / 16)) And 255))
		If w3 >= 0 Then _
			strOut = strOut + _
				Chr(((w2 * 16 + Int(w3 / 4)) And 255))
		If w4 >= 0 Then _
			strOut = strOut + _
				Chr(((w3 * 64 + w4) And 255))
	Next
	DecodeStr = strOut
End Function


Private Function mimeencode(byVal intIn)
	If intIn >= 0 Then 
		mimeencode = Mid(Base64Chars, intIn + 1, 1) 
	Else 
		mimeencode = ""
	End If
End Function

Function base64EncodeFromFile(filename)
	'on error resume next
    Dim objXMLDoc, objDocElem, objStream, sBase64String
    Set objXMLDoc = Server.CreateObject("MSXML2.DOMDocument")
        objXMLDoc.async = False
        objXMLDoc.validateOnParse = False
    Set objStream = Server.CreateObject("ADODB.Stream")
    objStream.Type = 1
    objStream.Open
    objStream.LoadFromFile filename'Server.MapPath(filename)
    'If err.Number <> 0 Then Exit Function
    Set objDocElem = objXMLDoc.createElement("A")
    objDocElem.dataType = "bin.base64"
    objDocElem.nodeTypedValue = objStream.Read
    sBase64String = objDocElem.text
    objStream.Close
    'Set objStream = Nothing
    'Set objDocElem = Nothing
    'Set objXMLDoc = Nothing
    base64EncodeFromFile = sBase64String
End Function

Function getExternalFile(sourceUrl, destinationFile)
	Set req = CreateObject("Msxml2.ServerXMLHTTP")
	req.Open "GET", sourceUrl, False
	req.Send
	
	Set stream = CreateObject("ADODB.Stream")
	stream.Type = 1 ''# adTypeBinary
	stream.Open
	stream.Write req.ResponseBody
	stream.SaveToFile destinationFile, 2
	stream.Close
	getExternalFile = destinationFile
End Function

Function Base64Encode(sText)
    'Dim oXML, oNode
	Set oXML = CreateObject("Msxml2.DOMDocument.3.0")
    Set oNode = oXML.CreateElement("base64")
    oNode.dataType = "bin.base64"
    oNode.nodeTypedValue =Stream_StringToBinary(sText)
    Base64Encode = oNode.text
    'Set oNode = Nothing
    'Set oXML = Nothing
End Function

Function Base64Decode(ByVal vCode)
    'Dim oXML, oNode
    Set oXML = CreateObject("Msxml2.DOMDocument.3.0")
    Set oNode = oXML.CreateElement("base64")
    oNode.dataType = "bin.base64"
    oNode.text = vCode
    Base64Decode = Stream_BinaryToString(oNode.nodeTypedValue)
    'Set oNode = Nothing
    'Set oXML = Nothing
End Function

%>