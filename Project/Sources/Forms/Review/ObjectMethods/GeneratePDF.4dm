

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Select a review.")
	
Else 
	Form:C1466.CurrentReview.generatePDF()
	
	File:C1566("/RESOURCES/pdf/test.pdf").setContent(Form:C1466.CurrentReview.DocumentPDF)
	
	OPEN URL:C673(File:C1566("/RESOURCES/pdf/test.pdf").platformPath)
	
End if 