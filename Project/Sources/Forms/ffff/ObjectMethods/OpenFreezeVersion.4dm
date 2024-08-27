If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne une review.")
	
Else 
	
	var $context : Object:=New object:C1471
	
	$context.type:="Freeze"
	$context.review:=Form:C1466.CurrentReview
	
	Open form window:C675("WP_Review")
	DIALOG:C40("WP_Review"; $context)
	
End if 