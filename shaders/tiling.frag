#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;

uniform int tiles;

void main()
{
    vec2 vtexCoord_mod = vec2(vtexCoord.x*tiles,vtexCoord.y*tiles);
    fragColor = frontColor * texture(colorMap, vtexCoord_mod);
}
