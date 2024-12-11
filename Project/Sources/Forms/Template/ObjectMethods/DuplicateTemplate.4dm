var $context : Object:=New object:C1471
var $template : cs:C1710.TemplateEntity
var $hwd : Integer


If (Form event code:C388=On Clicked:K2:4)
	
	If (Form:C1466.CurrentTemplate=Null:C1517)
		ALERT:C41("Select template.")
		
	Else 
		
		$newTemplateName:=Request:C163("What's the template's name?")
		If ($newTemplateName="")
			$newTemplateName:="New template"
		End if 
		$template:=ds:C1482.Template.new()
		$template.Name:=$newTemplateName
		$template.Template:=Form:C1466.CurrentTemplate.Template
		$template.save()
		
		Form:C1466.CurrentSelection:=ds:C1482.Template.all()
		
	End if 
End if 