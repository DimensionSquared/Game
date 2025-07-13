shader_type spatial;

uniform sampler2D texture_albedo : source_color;

void fragment() {
    vec2 uv = UV;

    // Convert integer texture size to float for multiplication
    vec2 tex_size = vec2(textureSize(texture_albedo, 0));

    // Sample texture without mipmaps
    vec4 tex_color = texelFetch(texture_albedo, ivec2(uv * tex_size), 0);

    ALBEDO = tex_color.rgb;
    ALPHA = tex_color.a;
}
