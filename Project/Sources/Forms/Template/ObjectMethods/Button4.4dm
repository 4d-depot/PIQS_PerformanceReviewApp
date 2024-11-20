var $context : Object:=New object:C1471
var $template : cs:C1710.TemplateEntity
var $hwd : Integer


If (Form event code:C388=On Load:K2:1)
	
	If (Form:C1466.CurrentTemplate=Null:C1517)
		ALERT:C41("Select template.")
		
	Else 
		
		$template:=ds:C1482.Template.new()
		$template.Name:="Form.newTemplateName"
		$template.Template:=Form:C1466.CurrentTemplate.Template
		$template.save()
		
		WParea:=WP New:C1317(Form:C1466.CurrentTemplate.Template)
		$context:=ds:C1482.Review.get(102).createContext()
		WP SET DATA CONTEXT:C1786(WParea; $context)
		WP COMPUTE FORMULAS:C1707(WParea)
		
	End if 
End if 