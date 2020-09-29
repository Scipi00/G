#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float amplitude = 0.1;
uniform float freq = 1; // expressada en Hz
uniform float time;

const float PI = 3.141592754;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    float escalar = amplitude*sin(2*PI*freq*time);
    frontColor = vec4(N.z);
    vtexCoord = texCoord;
    vec3 def_vertex = vertex + normal * escalar;
    gl_Position = modelViewProjectionMatrix * vec4(def_vertex, 1.0);
}
