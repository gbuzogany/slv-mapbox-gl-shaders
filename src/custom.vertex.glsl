#ifdef GL_ES
precision highp float;
#else
#define lowp
#define mediump
#define highp
#endif

attribute vec3 position;
attribute vec2 tex_coords;
attribute vec2 offset;

uniform mat4 u_mvp_matrix;
uniform vec2 u_texsize;
uniform highp float u_zoom;

varying vec2 v_texture_coord;

void main()
{
	vec2 delta = vec2(0.00001291749338624338, 0.00001291749339316084) * u_zoom * offset;
	gl_Position = u_mvp_matrix * (vec4(position, 1.0) + vec4(delta, 0.0, 0.0));
	if(position.z > 0.0)
	{
		gl_Position.z = 0.0;
	}
	else {
		gl_Position.z = 0.5;
	}

	v_texture_coord = tex_coords / u_texsize;
}