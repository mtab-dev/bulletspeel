shader_type canvas_item;

uniform vec4 blinkColor: source_color;
uniform float blinkIntesity = 0;
void fragment() {
	vec4 color = texture(TEXTURE, UV);
	color = mix(color, blinkColor, blinkIntesity * color.a);
	
	COLOR = color;
}
