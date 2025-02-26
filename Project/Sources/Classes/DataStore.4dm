Class extends DataStoreImplementation

exposed Function authentify($email : Text; $password : Text) : Text
	var $page : Text:="Login"
	var $pageCollaborator : Text:="CollaboratorPage"
	var $obj : Object
	var $employee : cs:C1710.EmployeeEntity
	var $typeREST:=False:C215
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
		If (Session:C1714.info=Null:C1517)
			$typeREST:=True:C214
		End if 
	End if 
	
	If ($obj.Employee=Null:C1517)
		Use ($obj)
			$obj.Employee:=New shared object:C1526
		End use 
	End if 
	
	$employee:=This:C1470.Employee.query("Email = :1"; $email).first()
	
	If ($employee#Null:C1517)
		If (Verify password hash:C1534($password; $employee.Password))
			
			Use ($obj.Employee)
				$obj.Employee.ID:=$employee.ID
				$obj.Employee.name:=$employee.Firstname+" "+$employee.Lastname
				$obj.Employee.role:="Collaborator"
				$obj.Employee.maxRole:="Collaborator"
				$obj.Employee.year:=Year of:C25(Current date:C33)
				$page:=$pageCollaborator
				
				If ($employee.ID_Departement=5)
					Session:C1714.setPrivileges("hr")
					$obj.Employee.maxRole:="HR"
				Else 
					Session:C1714.setPrivileges("user")
					If ($employee.Collaborator.length>0)
						$obj.Employee.maxRole:="Manager"
					End if 
				End if 
			End use 
			
			Session:C1714.setPrivileges("user")
			If ($typeREST)
				Web Form:C1735.setMessage("Authentication successfull")
			End if 
			
		Else 
			If ($typeREST)
				Web Form:C1735.setError("Authentication failed")
			End if 
		End if 
	Else 
		If ($typeREST)
			Web Form:C1735.setError("Authentication failed")
		End if 
	End if 
	
	return $page
	
exposed Function selectRole($role : Text)
	var $obj : Object
	
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
		$obj.Employee.role:=$role
	End use 
	
exposed Function getUserInfo : Object
	If (Session:C1714=Null:C1517)
		return Storage:C1525.Employee
	Else 
		return Session:C1714.storage.Employee
	End if 