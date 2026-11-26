shader_type sky;

float hash3(vec3 p) {
 p = fract(p * vec3(0.1031, 0.11369, 0.13787));
 p += dot(p, p.yzx + 19.19);
 return fract((p.x+p.y)*p.z);
}
void sky() {
 vec3 p = normalize(EYEDIR) * 206.0;
 vec3 cell = floor(p);
 float dot_size = length(fract(p) - vec3(0.5));
 float star = (1.0 - smoothstep(0.025, 0.16, dot_size)) * step(0.78, hash3(cell));
 COLOR = vec3(0.008,0.017,0.028) + star * mix(vec3(0.44,0.62,0.80), vec3(0.97,0.89,0.7), hash3(cell+3.7));
}
