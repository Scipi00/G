#version 330 core

in vec4 frontColor;
in vec3 fragVertex;
out vec4 fragColor;



void main()
{
    vec3 N = normalize(cross(dFdx(fragVertex), dFdy(fragVertex)));
    fragColor = frontColor * N.z;
}
