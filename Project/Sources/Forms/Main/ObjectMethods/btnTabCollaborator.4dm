Case of 
	: (Form event code:C388=On Clicked:K2:4)
		var $form : Text
		$form:=OBJECT Get value:C1743(OBJECT Get name:C1087(Object current:K67:2))
		OBJECT SET SUBFORM:C1138(*; "Subform"; $form)
		OBJECT SET VALUE:C1742("Subform"; Form:C1466.subCollaborator)
		OBJECT SET RGB COLORS:C628(*; "btnTab@"; Foreground color:K23:1)
		OBJECT SET RGB COLORS:C628(*; OBJECT Get name:C1087(Object current:K67:2); "#c32232")
End case 

