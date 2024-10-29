//%attributes = {}

TRUNCATE TABLE:C1051([Template:9])

var $templateFile : Object
var $obj : Object
var $template : cs:C1710.TemplateEntity

$templateFile:=JSON Parse:C1218(File:C1566("/RESOURCES/Dataset/Template.json").getText())

For each ($obj; $templateFile.Template)
	$template:=ds:C1482.Template.new()
	$template.ID:=$obj.ID
	$template.Name:=$obj.Name
	$template.Template:=WP Import document:C1318(File:C1566($obj.File).platformPath)
	$template.save()
End for each 