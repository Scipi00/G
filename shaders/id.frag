#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;

void main()
{
    int id = 432065;
    float id_size = 6.0;
    float scale = id_size / 10; //digits del dni / digits del decimal
    vec2 vtexCoord_mod = vtexCoord;
    if (vtexCoord.x < 1/id_size) {
    	vtexCoord_mod.x = vtexCoord.x * scale + (4-0)/10.; //digit target - digit position
    } else if (vtexCoord.x < 2/id_size) {
    	vtexCoord_mod.x = vtexCoord.x * scale + (3-1)/10.;
    } else if (vtexCoord.x < 3/id_size) {
    	vtexCoord_mod.x = vtexCoord.x * scale + (2-2)/10.;
    } else if (vtexCoord.x < 4/id_size) {
    	vtexCoord_mod.x = vtexCoord.x * scale + (0-3)/10.;
    } else if (vtexCoord.x < 5/id_size) {
    	vtexCoord_mod.x = vtexCoord.x * scale + (6-4)/10.;
    } else {
    	vtexCoord_mod.x = vtexCoord.x * scale + (5-5)/10.;
    }
    fragColor = texture(colorMap, vtexCoord_mod) * texture(colorMap, vtexCoord_mod).a;
    if (fragColor.a < 0.5) discard;
    else fragColor = vec4(0.,0.,1.,1.);
    
}
