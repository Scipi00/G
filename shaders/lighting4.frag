#version 330 core

in vec4 frontColor;
out vec4 fragColor;

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

in vec3 vertex_f;

in vec3 n;
in vec3 l;
in vec3 v;

void main()
{
    vec3 vertex_Eye = vertex_f;
    vec3 N = normalize(n);
    vec3 L = normalize(l);
    vec3 R = normalize((2*dot(n,l)*n) - l);
    vec3 V = normalize(v);
    float s = matShininess;
    vec4 Ka = matAmbient;
    vec4 Kd = matDiffuse;
    vec4 Ks = matSpecular;
    vec4 Ia = lightAmbient;
    vec4 Id = lightDiffuse;
    vec4 Is = lightSpecular;
    vec4 Ke = frontColor;
    fragColor = Ka*Ia + Kd*Id*max(dot(N,L),0.0) + Ks*Is*pow(max(dot(R,V),0.0),s);
}
