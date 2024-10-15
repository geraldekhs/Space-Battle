shader_type canvas_item;

uniform vec4 flash_color;
uniform float flash_value : hint_range(0.0, 1.0, 0.1);

void vertex() {
    // Called for every vertex the material is visible on.
}

void fragment() {
    // Called for every pixel the material is visible on.
    vec4 texture_colour = texture(TEXTURE, UV);
    COLOR = mix(texture_colour, flash_color, flash_value);
    COLOR.a = texture_colour.a;
}