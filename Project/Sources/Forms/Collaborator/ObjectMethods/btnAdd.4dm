
If (Form event code:C388=On Clicked:K2:4)
	var $o : cs:C1710.EmployeeEntity
	var $h : Integer
	$o:=ds:C1482.Employee.new()
	$h:=Open form window:C675("Collaborator_Edit")
	DIALOG:C40("Collaborator_Edit"; $o)
End if 