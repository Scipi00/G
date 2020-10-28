#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;
out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix; 
uniform mat3 normalMatrix;

void main()
{
    vec3 vertex_mod = vertex;
    vertex_mod.y *= 3/4.;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex_mod, 1.0);
}

