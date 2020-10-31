#version 330 core
        
layout(triangles_adjacency) in;
layout(triangle_strip, max_vertices = 36) out;


in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 projectionMatrix;

const float areamax = 0.0005;

vec4 R = vec4(1.0,0.0,0.0,1.0);
vec4 Y = vec4(1.0,1.0,0.0,1.0);

void main( void )
{
    //vec4 vector1 =  gl_in[2].gl_Position - gl_in[0].gl_Position;
    //vec4 vector2 = gl_in[4].gl_Position - gl_in[0].gl_Position;
    
    //float area = dot(vector1, vector2);

    //float normalized = area/areamax;

    //gfrontColor = mix(R,Y,normalized);     
    gfrontColor = R;
    for (int i = 0; i < 6; i+=2) {
        gl_Position = gl_in[i].gl_Position; EmitVertex();
    }
        EndPrimitive();
}
