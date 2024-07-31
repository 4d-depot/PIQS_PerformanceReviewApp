Class extends DataStoreImplementation

exposed Function authentify($email : Text; $password : Text) : Text
	
	var $obj : Object
	var $employee : cs:C1710.Employee
	$employee:=This:C1470.Employee.query("Email = :1"; $email).first()
	
	If ($employee#Null:C1517)
		If (Verify password hash:C1534($password; $employee.Password))
			
			If (Session:C1714=Null:C1517)
				$obj:=Storage:C1525
			Else 
				$obj:=Session:C1714.storage
			End if 
			
			If ($obj.Employee=Null:C1517)
				Use ($obj)
					$obj.Employee:=New shared object:C1526
				End use 
			End if 
			
			Use ($obj.Employee)
				$obj.Employee.ID:=$employee.ID
				$obj.Employee.name:=$employee.Firstname+" "+$employee.Lastname
			End use 
			
			//TODO set privilege
			
			return "Authentication successfull"
		Else 
			return "Authentication failed: wrong password"
		End if 
	Else 
		return "Authentication failed: wrong user"
	End if 
	
exposed Function logout()
	var $obj : Object
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	Use ($obj.Employee)
		OB REMOVE:C1226($obj; "Employee")
	End use 
	
	
exposed Function selectRole($role : Text)
	var $obj : Object
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	Use ($obj.Employee)
		$obj.Employee.role:=$role
	End use 
	
exposed Function getName : Text
	
	If (Session:C1714=Null:C1517)
		return Storage:C1525.Employee.name
	Else 
		return Session:C1714.Storage.Employee.name
	End if 
	
exposed Function getRole : Text
	
	If (Session:C1714=Null:C1517)
		return Storage:C1525.Employee.role
	Else 
		return Session:C1714.Storage.Employee.role
	End if 
	