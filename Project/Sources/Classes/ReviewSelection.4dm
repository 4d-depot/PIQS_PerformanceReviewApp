Class extends EntitySelection

exposed Function dashboardStatus() : Object
	var $col : Collection
	$col:=This:C1470.distinct("ID_Status"; dk count values:K85:36)
	
	$obj:=New object:C1471
	$obj.series:=$col.extract("count")
	$obj.options:=New object:C1471
	$obj.options.labels:=$col.extract("value").map(Formula:C1597(ds:C1482.ReviewStatus.get($1.value).Name))
	
	return $obj
	
	
exposed Function dashboardScore() : Object
	
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
		$obj.Employee.role:="Collaborator"
	End use 
	
	$obj:=New object:C1471
	$obj.options:=New object:C1471
	$obj.options.xaxis:=New object:C1471
	$obj.options.xaxis.categories:=["2020"; "2021"; "2022"; "2023"; "2024"]
	$obj.series:=New collection:C1472
	$p:=This:C1470.query("ID_Employee = :1"; This:C1470.first().ID_Employee).orderBy("Date").extract("ID_ScoreGoal")
	$obj.series.push({name: String:C10($o); data: $p})
	
	return $obj
	
exposed Function dashboardScore2() : Object
	
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
		$obj.Employee.role:="Manager"
	End use 
	
	$col:=This:C1470.distinct("ID_Employee")
	
	$obj:=New object:C1471
	$obj.options:=New object:C1471
	$obj.options.xaxis:=New object:C1471
	$obj.options.xaxis.categories:=$col
	$obj.series:=New collection:C1472
	
	For each ($o; $col)
		$p:=This:C1470.query("ID_Employee = :1 AND Date >= :2 AND Date <= :3"; $o; String:C10($year)+"/01/01"; String:C10($year)+"/12/31").orderBy("Date").extract("ID_ScoreGoal")
		$obj.series.push({name: String:C10($o); data: $p})
	End for each 
	
	return $obj