Class extends Entity

Function createContext() : Object
	$context:=New object:C1471
	$context.review:=This:C1470
	$context.previousReview:=This:C1470.previousReview
	return $context
	
Function generateFreezeDocument()
	
Function generatePDF($filePath : Text)
	
	WP EXPORT DOCUMENT:C1337(This:C1470.DocumentFreeze; $filePath; wk pdf:K81:315)