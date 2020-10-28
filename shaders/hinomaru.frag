#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

//uniform sampler2D colorMap;
uniform float n = 8;

vec3 checkerboard (vec2 vtexCoord) {
	vec3 colorMap;
	float radius = 0.2;
	vec2 center = vec2(0.5,0.5);
	float d = distance(center,vtexCoord);
	float notred = step(radius,d);
	colorMap = vec3(1.,notred,notred);
	return colorMap;
}

void main() {
    fragColor = vec4(checkerboard(vtexCoord),1);
}
