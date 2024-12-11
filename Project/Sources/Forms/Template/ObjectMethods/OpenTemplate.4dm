var $context : Object:=New object:C1471
var $hwd : Integer

If (Form:C1466.CurrentTemplate=Null:C1517)
	ALERT:C41("Select template.")
	
Else 
	
	$context.type:="Template"
	$context.template:=Form:C1466.CurrentTemplate
	
	$hwd:=Open form window:C675("WP_Review")
	SET WINDOW TITLE:C213("Template: "+Form:C1466.CurrentTemplate.Name; $hwd)
	DIALOG:C40("WP_Review"; $context)
	
End if 