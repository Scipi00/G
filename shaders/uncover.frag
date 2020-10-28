#version 330 core

in vec4 fragVertex;
out vec4 fragColor;

uniform float time;

void main()
{
    float NDC_x = ((fragVertex.x/fragVertex.w)+1)/2;
    if (time >= 2) fragColor = vec4(0.,0.,1.,1.);
    else if (NDC_x <= time/2) fragColor = vec4(0.,0.,1.,1.);
    else discard;
} 
