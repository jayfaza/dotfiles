// Generated Waves Shader
precision highp float;

varying vec2 v_coords;
uniform vec2 size;
uniform float alpha;
uniform vec2 u_camera;
uniform float u_time;

void main() {
    vec2 screen_pixel = v_coords * size;
    vec2 canvas_pos = screen_pixel + u_camera;
    vec2 pos = canvas_pos / (100.0 * 1.00);
    
    float wave1 = sin(pos.x * 10.0 + u_time * 1.00) * 0.5 + 0.5;
    float wave2 = sin(pos.y * 10.0 + u_time * 1.00 * 0.75) * 0.5 + 0.5;
    
    vec3 color1 = vec3(0.20, 0.10, 0.30);
    vec3 color2 = vec3(0.10, 0.20, 0.40);
    vec3 color = mix(color1, color2, wave1 * wave2);
    
    vec2 uv = v_coords;
    float vignette = 1.0 - length(uv - 0.5) * 0.5;
    color *= vignette;
    color += vec3(0.10);
    
    gl_FragColor = vec4(color, 1.0) * alpha;
}
