#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D explosion;

uniform float time;


void main()
{
    int speed = 30; //speed = 1/freq frames per second
    int num_frames = 48;
    int frame = int (mod(floor(time*speed),num_frames)); //en cual de los 48 frames estas
    float offset_columna = mod(frame,8) * 1./8;
    float offset_fila = (5./6) - floor(frame/8.) * 1./6;
    float texture_x = ( (vtexCoord.x / 8.) + offset_columna);
    float texture_y = ( (vtexCoord.y / 6.) + offset_fila);
    vec2 vtexCoord_mod = vec2(texture_x,texture_y);
    fragColor = texture(explosion, vtexCoord_mod) * texture(explosion, vtexCoord_mod).a;
}
