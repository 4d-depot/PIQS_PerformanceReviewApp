

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Form:C1466.review=Null:C1517)
			Form:C1466.review:=ds:C1482.Review.get(1)
		End if 
End case 