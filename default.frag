#version 330 core

out vec4 color;
layout(location = 0) in vec3 vertex;

in vec4 model_vertex;
in vec4 world_vertex;
in vec4 camera_vertex;
in vec4 vp_vertex;

uniform vec3 camera_position;
uniform vec4 passed_color;

flat in int no_draw;

void main(void)
{
  color = passed_color;
}