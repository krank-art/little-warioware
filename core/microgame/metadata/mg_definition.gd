extends Resource
class_name MicrogameDefinition

enum InputType {
    MASH, # TODO - i don't love this for arrows+button but it seems to be the (WarioWare) Gold standard
}

@export var title: String
@export var short_hint: String
@export var credits: Array # (Array, Resource)
@export var input_type: InputType
@export var scene: String # TODO - do we really need this or can we infer from directory? # (String, FILE, "*.tscn")