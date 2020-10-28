#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
    fragColor = vec4(0.5,0.75,0.5,1);
    if (vtexCoord.x > 3/6. && vtexCoord.x < 5/6. &&
    	 vtexCoord.y > 0.5-2/9. && vtexCoord.y < 0.5+2/9. ) fragColor = vec4(1.);
    float d = sqrt(pow(vtexCoord.x-0.3,2)+pow((vtexCoord.y*3/4.)-0.4,2));
    float d2 = sqrt(pow(vtexCoord.x-0.45,2)+pow((vtexCoord.y*3/4.)-0.4,2));
    if (d < 0.25 && d2 > 0.27) fragColor = vec4(1.);
}
