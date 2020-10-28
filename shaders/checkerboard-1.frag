#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

//uniform sampler2D colorMap;
uniform float n = 8;

vec3 checkerboard (vec2 vtexCoord) {
	float tile_size = 1/n;
	vec3 colorMap = vec3(0);
	int tile_x = int (floor(vtexCoord.x/tile_size) );
	int tile_y = int (floor(vtexCoord.y/tile_size) );
	if ( (tile_x+tile_y)%2 == 0 ) {
		colorMap = vec3(0.8);
	} else {
		colorMap = vec3(0.);
	}
	return colorMap;
}

void main() {
    fragColor = vec4(checkerboard(vtexCoord),1);
}

