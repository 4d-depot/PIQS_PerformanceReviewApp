$value:=Request:C163("Please enter the group:")

If (Form:C1466.currentGroup.value=Null:C1517)
	Form:C1466.currentGroup.value:=[$value]
Else 
	Form:C1466.currentGroup.value.push($value)
End if 