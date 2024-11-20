var $context : Object:=New object:C1471
var $template : cs:C1710.TemplateEntity
var $hwd : Integer

$template:=ds:C1482.Template.new()
$template.Name:="Form.newTemplateName"
$template.Template:=WP New:C1317()
$template.save()

$context.context:=New object:C1471
$context.type:="Template"
$context.template:=$template

$hwd:=Open form window:C675("WP_Review")
DIALOG:C40("WP_Review"; $context)
