
shared singleton Class constructor
	
shared Function set Role($role : Text)
	
	If (Session:C1714=Null:C1517)
		Use (Storage:C1525)
			Storage:C1525.role:=$role
		End use 
	Else 
		Session:C1714.storage.role:=$role
	End if 
	
/*
Use (Storage)
Storage.mydata:=New shared object
Use (Storage.mydata)
Storage.mydata.prop1:="Smith"
Storage.mydata.prop2:=100
End use 
End use 
*/
	
	
shared Function set ID($id : Integer)
	
	If (Session:C1714=Null:C1517)
		Storage:C1525.ID:=$id
	Else 
		Session:C1714.storage.ID:=$id
	End if 
	
shared Function set Person($person : Text)
	
	If (Session:C1714=Null:C1517)
		Storage:C1525.person:=$person
	Else 
		Session:C1714.storage.person:=$person
	End if 
	
	