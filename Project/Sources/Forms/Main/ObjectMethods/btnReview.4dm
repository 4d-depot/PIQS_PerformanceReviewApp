Case of 
	: (Form event code:C388=On Clicked:K2:4)
		var $form : Text
		$form:=OBJECT Get value:C1743(OBJECT Get name:C1087(Object current:K67:2))
		OBJECT SET SUBFORM:C1138(*; "Subform"; $form)
End case 

