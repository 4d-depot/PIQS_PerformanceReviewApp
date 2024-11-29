
var $context : Object:=New object:C1471
var $hwd : Integer

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne une review.")
	
Else 
	
	$context.type:="Compute"
	$context.review:=Form:C1466.CurrentReview
	
	$hwd:=Open form window:C675("WP_Review")
	DIALOG:C40("WP_Review"; $context)
	
End if 