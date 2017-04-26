#ifdef GL_ES
precision highp float;
#else
#define lowp
#define mediump
#define highp
#endif

varying vec2 v_texture_coord;

uniform sampler2D u_sampler;

void main()
{
    gl_FragColor = texture2D(u_sampler, v_texture_coord);
}