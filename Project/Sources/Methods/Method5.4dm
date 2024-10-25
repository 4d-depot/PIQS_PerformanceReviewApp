//%attributes = {}
$s:=ds:C1482.Employee.all()

For each ($e; $s)
	$e.isActive:=True:C214
	$e.save()
End for each 


