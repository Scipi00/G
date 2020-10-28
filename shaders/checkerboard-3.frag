#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

//uniform sampler2D colorMap;
uniform float n = 8;

vec3 checkerboard (vec2 vtexCoord) {
	float tile_size = 1/n;
	float line_size = tile_size/9.;
	vec3 colorMap = vec3(0);
	float tile_x = mod(vtexCoord.x, tile_size);
	float tile_y = mod(vtexCoord.y, tile_size);
	if ( (tile_x < line_size) || (tile_y < line_size) ) {
		colorMap = vec3(0.);
	} else {
		colorMap = vec3(0.8);
	}
	return colorMap;
}

void main() {
    fragColor = vec4(checkerboard(vtexCoord),1);
}
