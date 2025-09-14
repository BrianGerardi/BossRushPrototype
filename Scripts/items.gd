extends Resource
class_name items

@export var name : String
@export var icon : Texture2D
@export_multiline var itemdescription : String
@export var precio : int = 0
enum TIPO_DE_ITEM{
	POCION,
	ARMADURA,
	ARMA
}

@export var tipo : TIPO_DE_ITEM
