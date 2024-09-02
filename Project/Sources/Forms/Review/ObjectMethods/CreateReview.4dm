
var $context : Object:=New object:C1471

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne la dernière review.")
	
Else 
	
	// Create review
	var $review : cs:C1710.ReviewEntity
	$review:=ds:C1482.Review.new()
	$review.createReview(Form:C1466.CurrentEmployee.ID)
	
End if 