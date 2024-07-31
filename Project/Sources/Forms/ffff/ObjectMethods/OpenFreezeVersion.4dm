
var $context : Object:=New object:C1471

$context.type:="Freeze"
$context.DocumentFreeze:=Form:C1466.CurrentReview.DocumentFreeze
Open form window:C675("WP_Review")
DIALOG:C40("WP_Review"; $context)