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

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0)*abs(N.z);
    vtexCoord = texCoord;
    vec4 dis_pos =  modelViewProjectionMatrix * vec4(vertex, 1.0);
    dis_pos = dis_pos * vec4(1.,1.,-1.,1.);
    gl_Position = dis_pos;
}
