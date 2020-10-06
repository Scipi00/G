#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D explosion;

uniform float time;


void main()
{

    float speed = 30.; //speed = 1/freq
    int num_frames = 48;
    int frame =int( mod( time*speed, float (num_frames)) );
    float offset_fila = mod(frame,8) * 1/6;
    float offset_columna = fract(frame/8) * 1/8;
    vec2 vtexCoord_mod = vec2(vtexCoord.x + offset_fila, vtexCoord.y - offset_columna + (5/6) );
    fragColor = frontColor * texture(explosion, vtexCoord_mod);
}
