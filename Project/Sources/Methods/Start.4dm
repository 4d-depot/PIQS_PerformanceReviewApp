//%attributes = {}
var $ps; $win : Integer

Case of 
	: (Count parameters:C259=0)
		$ps:=New process:C317(Current method name:C684; 0; Current method name:C684; 0)
		
	Else 
		
		$win:=Open form window:C675("Main"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		ds:C1482.selectRole("HR")
		DIALOG:C40("Main")
		CLOSE WINDOW:C154
		
End case 

