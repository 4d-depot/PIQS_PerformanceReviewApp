var $template : cs:C1710.TemplateEntity
var $newTemplateName : Text

$newTemplateName:=Request:C163("What's the template's name?")
If ($newTemplateName="")
	$newTemplateName:="New template"
End if 
$template:=ds:C1482.Template.new()
$template.Name:=$newTemplateName
$template.Template:=WP New:C1317()
$template.save()

Form:C1466.CurrentSelection:=ds:C1482.Template.all()

