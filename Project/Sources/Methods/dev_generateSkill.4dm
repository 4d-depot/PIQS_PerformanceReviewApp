//%attributes = {}

var $obj : Object
var $col : Collection
var $skill : Collection

$skill:=New collection:C1472

$col:=New collection:C1472
$col.push("Qualité relationnelle")
$col.push("Communication orale")
$col.push("Communication écrite")
$col.push("Capacité d’écoute")
$col.push("Résistance à la pression")
$col.push("Contribution à l’équipe")
$obj:=New object:C1471("group"; "Travail en équipe"; "value"; $col)
$skill.push($obj)

$col:=New collection:C1472
$col.push("Esprit d’initiative")
$col.push("Curiosité intellectuelle")
$col.push("Créativité")
$col.push("Capacité à se remettre en cause")
$obj:=New object:C1471("group"; "Adaptation au changement"; "value"; $col)
$skill.push($obj)

$col:=New collection:C1472
$col.push("Maîtrise des techniques clés")
$col.push("Autonomie")
$col.push("Qualité des réalisations")
$col.push("Gestion des priorités")
$col.push("Respect des délais")
$obj:=New object:C1471("group"; "Compétence dans la fonction"; "value"; $col)
$skill.push($obj)

$col:=New collection:C1472
$col.push("Orientation client (interne et externe)")
$col.push("Communication ouverte (transparence)")
$col.push("Engagement personnel")
$obj:=New object:C1471("group"; "Attitude clé"; "value"; $col)
$skill.push($obj)

$col:=New collection:C1472
$col.push("Leadership")
$obj:=New object:C1471("group"; "Fonction d'encradrement"; "value"; $col)
$skill.push($obj)


$entity:=ds:C1482.Settings.get(1)
$entity.Skill:=New object:C1471("skill"; $skill)
$entity.save()