#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec4 porjectionVertex = modelViewProjectionMatrix * vec4(vertex, 1.0);
    float NDC_x = (porjectionVertex.x/porjectionVertex.w);
    float NDC_y = (porjectionVertex.y/porjectionVertex.w);
    float NDC_z = (porjectionVertex.z/porjectionVertex.w);
    vec3 NDC_vertex = vec3(NDC_x,NDC_y,NDC_z);
    float escalar = 0.5 + abs(sin(time));
    NDC_vertex.x = NDC_vertex.x * escalar;
    NDC_vertex.y = NDC_vertex.y * escalar;
    frontColor = vec4(color,1.0)*N.z;
    vtexCoord = texCoord;
    gl_Position = vec4(NDC_vertex,1);
}
