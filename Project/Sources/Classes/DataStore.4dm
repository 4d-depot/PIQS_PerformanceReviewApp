Class extends DataStoreImplementation

exposed Function authentify($email : Text; $password : Text) : Text
	var $page : Text:="Login"
	var $pageCollaborator : Text:="CollaboratorPage"
	var $obj : Object
	var $employee : cs:C1710.Employee
	
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
		$obj.Employee.authentify:=False:C215
	End use 
	
	$employee:=This:C1470.Employee.query("Email = :1"; $email).first()
	
	If ($employee#Null:C1517)
		If (Verify password hash:C1534($password; $employee.Password))
			
			Use ($obj.Employee)
				$obj.Employee.ID:=$employee.ID
				$obj.Employee.name:=$employee.Firstname+" "+$employee.Lastname
				$obj.Employee.role:="Collaborator"
				$obj.Employee.maxRole:=""
				$obj.Employee.authentify:=True:C214
				$page:=$pageCollaborator
				
				If ($employee.ID_Departement=5)
					Session:C1714.setPrivileges("hr")
					$obj.Employee.maxRole:="HR"
				Else 
					Session:C1714.setPrivileges("user")
					If ($employee.Collaborator.length>0)
						$obj.Employee.maxRole:="Manager"
					Else 
						$obj.Employee.maxRole:="Collaborator"
					End if 
				End if 
			End use 
			
			Web Form:C1735.setMessage("Authentication successfull")
			
		Else 
			Web Form:C1735.setError("Authentication failed: wrong password")
		End if 
	Else 
		Web Form:C1735.setError("Authentication failed: wrong user")
	End if 
	
	return $page
	
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
		return Session:C1714.storage.Employee.name
	End if 
	
exposed Function getRole : Text
	
	If (Session:C1714=Null:C1517)
		return Storage:C1525.Employee.role
	Else 
		return Session:C1714.storage.Employee.role
	End if 
	
exposed Function getMaxRole : Text
	
	If (Session:C1714=Null:C1517)
		return Storage:C1525.Employee.maxRole
	Else 
		return Session:C1714.storage.Employee.maxRole
	End if 
	