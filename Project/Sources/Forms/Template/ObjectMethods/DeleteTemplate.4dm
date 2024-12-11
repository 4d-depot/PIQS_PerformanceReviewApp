var $context : Object:=New object:C1471
var $template : cs:C1710.TemplateEntity

If (Form:C1466.CurrentTemplate=Null:C1517)
	ALERT:C41("Select a template.")
	
Else 
	
	CONFIRM:C162("Are you sure you want to delete the template: "+Form:C1466.CurrentTemplate.Name+"?")
	If (OK=1)
		$template:=Form:C1466.CurrentTemplate
		$template.drop()
		Form:C1466.CurrentSelection:=ds:C1482.Template.all()
	Else 
		ALERT:C41("Operation canceled.")
	End if 
	
End if 