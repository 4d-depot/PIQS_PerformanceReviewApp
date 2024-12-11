var $newTemplateName : Text

If (Form:C1466.CurrentTemplate=Null:C1517)
	ALERT:C41("Select template.")
	
Else 
	
	$newTemplateName:=Request:C163("What's the new template's name?")
	If ($newTemplateName#"")
		Form:C1466.CurrentTemplate.Name:=$newTemplateName
		Form:C1466.CurrentTemplate.save()
	End if 
	
End if 