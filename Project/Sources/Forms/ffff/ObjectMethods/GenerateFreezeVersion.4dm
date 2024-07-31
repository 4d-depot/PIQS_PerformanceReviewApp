
var $context : Object:=New object:C1471

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne une review.")
	
Else 
	
	// Context
	$context:=Form:C1466.CurrentReview.createContext()
	
	// Compute doc
	$doc:=WP New:C1317($context.review.Document)
	WP SET DATA CONTEXT:C1786($doc; $context)
	WP COMPUTE FORMULAS:C1707($doc)
	WP FREEZE FORMULAS:C1708($doc)
	
	// Save doc
	Form:C1466.CurrentReview.DocumentFreeze:=$doc
	Form:C1466.CurrentReview.save()
	
End if 