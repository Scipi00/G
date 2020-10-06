#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;

uniform float time;
uniform float speed = 0.1;

void main()
{
    vec2 vtexCoord_mod = vec2(vtexCoord.x + speed * time,vtexCoord.y + speed * time);
    fragColor = frontColor * texture(colorMap, vtexCoord_mod);
}
