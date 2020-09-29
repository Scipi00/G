#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMax;
uniform vec3 boundingBoxMin;

uniform bool eyespace = true;
uniform float time;

const float PI = 3.141592;

float diagonal() {
	float dx = boundingBoxMax.x - boundingBoxMin.x;
	float dy = boundingBoxMax.y - boundingBoxMin.y;
	float dz = boundingBoxMax.z - boundingBoxMin.z;
	float diag = sqrt(pow(dx,2)+pow(dy,2)+pow(dz,2));
	return diag;
}

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    vec3 def_vertex = vertex;
    float r = diagonal()/2;
    float amp = (r/10);
    if (eyespace) amp *= (viewMatrix * modelMatrix * vec4(def_vertex, 1.0)).y;
    else amp *= vertex.y;
    float escalar = amp * sin(time);
    def_vertex = def_vertex + normal*escalar;
    gl_Position = modelViewProjectionMatrix * vec4(def_vertex, 1.0);
}
