#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;

const float PI = 3.141592;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    float escalar;
    if (vertex.y < 0.5) escalar = 0;
    else escalar = (vertex.y-0.5)*sin(time);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    mat4 RotationMatrix = mat4(  vec4(1.,0.,0.,0.)
				,vec4(0.,cos(escalar),-sin(escalar),0.)
				,vec4(0.,sin(escalar),cos(escalar),0.)
				,vec4(0.,0.,0.,1.));
    RotationMatrix = transpose(RotationMatrix);
    vec4 def_vertex = vec4(vertex,1.);
    def_vertex = vec4(def_vertex.x,def_vertex.y-1,def_vertex.z,1.);
    def_vertex = RotationMatrix * def_vertex;
    def_vertex = vec4(def_vertex.x,def_vertex.y+1,def_vertex.z,1.);
    gl_Position = modelViewProjectionMatrix * def_vertex;
}
