#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    float relative_y = 4 * (vertex.y - boundingBoxMin.y)/(boundingBoxMax.y - boundingBoxMin.y);
    vec3 dist_color = vec3(0,0,0); //black error shoutout
    if ((0 <= relative_y) && (relative_y < 1)) {
    	dist_color = mix(vec3(1,0,0),vec3(1,1,0),fract(relative_y));
    } else if ((1 <= relative_y) && (relative_y < 2)) {
    	dist_color = mix(vec3(1,1,0),vec3(0,1,0),fract(relative_y));
    } else if ((2 <= relative_y) && (relative_y < 3)) {
    	dist_color = mix(vec3(0,1,0),vec3(0,1,1),fract(relative_y));
    } else if ((3 <= relative_y) && (relative_y < 4)) {
    	dist_color = mix(vec3(0,1,1),vec3(0,0,1),fract(relative_y));
    } else if (relative_y == 4) {
    	dist_color = vec3(0,0,1);
    }
    frontColor = vec4(dist_color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
