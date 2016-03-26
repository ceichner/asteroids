#version 330 core

out vec4 color;
layout(location = 0) in vec3 vertex;

uniform mat4 world_transform;
uniform mat4 camera_transform;
uniform mat4 vp_transform;

out vec4 model_vertex;
out vec4 world_vertex;
out vec4 camera_vertex;
out vec4 vp_vertex;

flat out int no_draw;

void main(void)
{
  gl_Position = vec4(vertex, 1.0);
  
  gl_Position *= vp_transform;
  
  if(gl_Position.w < 0.5)
    no_draw = 1;
  
  gl_Position /= gl_Position.w;
  
  model_vertex = vec4(vertex, 1.0);
  world_vertex = model_vertex * world_transform;
  camera_vertex = model_vertex * camera_transform;
  vp_vertex = model_vertex * vp_transform;
  
  // frustum clipping
  if(camera_vertex.z < 0)
    gl_Position *= -1;
}