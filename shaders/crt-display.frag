#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n;

void main()
{
    vec2 fragCoord = (gl_FragCoord - vec4(0.5)).xy;
    if (mod(fragCoord.y,n) != 0) discard;
    fragColor = frontColor;
}
