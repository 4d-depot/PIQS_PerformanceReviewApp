//%attributes = {}

var $obj : Object
var $col : Collection
var $skill : Collection

$skill:=New collection:C1472

$col:=New collection:C1472
$col.push("Talent Acquisition")
$col.push("Interviewing Techniques")
$col.push("Job Analysis and Design")
$col.push("Candidate Screening")
$obj:=New object:C1471("group"; "Recruitment and Selectio"; "value"; $col)
$skill.push($obj)

$col:=New collection:C1472
$col.push("Conflict Resolution")
$col.push("Communication Skills")
$col.push("Performance Testing")
$col.push("Employee Engagement Strategies")
$obj:=New object:C1471("group"; "Employee Relations"; "value"; $col)
$skill.push($obj)

$col:=New collection:C1472
$col.push("Learning and Development Program Design")
$col.push("Performance Management Systems")
$col.push("Coaching and Mentoring")
$col.push("Needs Assessment")
$obj:=New object:C1471("group"; "Training and Development"; "value"; $col)
$skill.push($obj)

$col:=New collection:C1472
$col.push("Labor Law Knowledge")
$col.push("Policy Development and Implementation")
$col.push("Risk Management")
$col.push("Employee Rights Awareness")
$obj:=New object:C1471("group"; "Compliance and Legal Knowledge"; "value"; $col)
$skill.push($obj)

$col:=New collection:C1472
$col.push("Salary Structure Development")
$col.push("Compensation Analysis")
$col.push("Benefits Administration")
$col.push("Payroll Management")
$obj:=New object:C1471("group"; "Compensation and Benefits"; "value"; $col)
$skill.push($obj)

$entity:=ds:C1482.Departement.get(5)
$entity.Skill:=New object:C1471("skill"; $skill)
$entity.save()



