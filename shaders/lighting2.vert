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
uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec3 L = normalize(vertex - vec3(lightPosition.xyz));
    vec3 R = normalize( (2*dot(N,L)*N) - L );
    vec3 V = normalize(vertex*-1);
    float s = matShininess;
    vec4 Ia = matAmbient;
    vec4 Id = matDiffuse;
    vec4 Is = matSpecular;
    vec4 Ka = lightAmbient;
    vec4 Kd = lightDiffuse;
    vec4 Ks = lightSpecular;
    vec3 Ke = color;
    frontColor = Ka*Ia + Kd*Id(max(dot(N,L),0.0)) + Ks*Is*pow(max(dot(R,V),0.0),s);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
