Class extends DataClass

exposed Function loadStatus() : cs:C1710.ReviewStatusSelection
	
	If (ds:C1482.getUserInfo()#Null:C1517)
		
		If (ds:C1482.getUserInfo().role="HR")
			return This:C1470.all()
		Else 
			return This:C1470.query("ID < :1"; 4)
		End if 
		
	End if 
	
	return Null:C1517