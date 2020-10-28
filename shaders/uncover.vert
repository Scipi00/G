#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;

out vec4 fragVertex;

void main()
{
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    fragVertex = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
