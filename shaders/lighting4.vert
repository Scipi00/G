#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 lightPosition;

uniform vec4 matAmbient;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

out vec3 vertex_f;
out vec3 n;
out vec3 l;
out vec3 v;

void main()
{
    vec3 vertex_Eye =(modelViewMatrix * vec4(vertex,1)).xyz;
    vertex_f = vertex_Eye;
    vec3 N = normalize(normalMatrix * normal);
    n = N;
    vec3 L = normalize(lightPosition.xyz - vertex_Eye);
    l = L;
    vec3 R = normalize( (2*dot(N,L)*N) - L );
    vec3 V = normalize(vertex_Eye * -1 );
    v = V;
    float s = matShininess;
    vec4 Ka = matAmbient;
    vec4 Kd = matDiffuse;
    vec4 Ks = matSpecular;
    vec4 Ia = lightAmbient;
    vec4 Id = lightDiffuse;
    vec4 Is = lightSpecular;
    vec4 Ke = frontColor;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
