
If (Form event code:C388=On Clicked:K2:4)
	$result:=ds:C1482.authentify(Form:C1466.login; Form:C1466.password)
	
	If (ds:C1482.getUserInfo().maxRole="HR")
		ds:C1482.selectRole("HR")
		CANCEL:C270
		
	Else 
		ALERT:C41("Authentification failed")
	End if 
End if 