extends GPUParticles3D

@onready var shatter := $Shatter2 as GPUParticles3D
var color := Color.ALICE_BLUE
		
func set_color():
	var mesh := draw_pass_3 as ArrayMesh
	var mat := shatter.draw_pass_2.material as StandardMaterial3D
	var material := mesh.surface_get_material(0) as ShaderMaterial
	material.set_shader_parameter("albedo", color)
	mat.albedo_color = color

func _on_color_picker_button_color_changed(color):
	self.color = color
	set_color()
