var $context : Object:=New object:C1471
var $template : cs:C1710.TemplateEntity
var $hwd : Integer

If (Form:C1466.WPexpression=Null:C1517)
	Form:C1466.WPexpression:=JSON Parse:C1218(File:C1566("/RESOURCES/4DWP_Wizard/WPexpression.json").getText()).expression
	Form:C1466.dropFormula:=New object:C1471
	Form:C1466.dropFormula.values:=Form:C1466.WPexpression.extract("name")
	Form:C1466.dropFormula.index:=-1
	Form:C1466.dropFormula.currentValue:="Select a formula"
End if 

$template:=ds:C1482.Template.new()
$template.Name:="Form.newTemplateName"
$template.Template:=WP New:C1317()
$template.save()

$context.context:=New object:C1471
$context.type:="Template"
$context.template:=$template

$hwd:=Open form window:C675("WP_Review")
DIALOG:C40("WP_Review"; $context)
