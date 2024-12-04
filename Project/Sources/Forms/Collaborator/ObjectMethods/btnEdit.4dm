
If (Form event code:C388=On Clicked:K2:4)
	var $h : Integer
	$h:=Open form window:C675("Collaborator_Edit")
	DIALOG:C40("Collaborator_Edit"; Form:C1466.CurrentItem)
End if 