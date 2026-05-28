shader_type spatial;
render_mode diffuse_toon, specular_toon;

uniform vec4 albedo_color : source_color = vec4(1, 1, 1, 1);
uniform sampler2D albedo_texture : hint_default_white;
uniform float rim : hint_range(0.0, 1.0) = 0.0;
uniform float metallic : hint_range(0.0, 1.0) = 0.0;
uniform float specular : hint_range(0.0, 1.0) = 0.5;
uniform float roughness : hint_range(0.0, 1.0) = 1.0;

void vertex() {}

void fragment() {
	if (rim > 0.0) {
		RIM = rim;
	}
  	METALLIC = metallic;
	SPECULAR = specular;
  	ROUGHNESS = roughness;
	vec4 albedo = albedo_color * texture(albedo_texture, UV);
	ALBEDO = albedo.rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
