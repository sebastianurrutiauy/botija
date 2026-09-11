shader_type canvas_item;
// Temporary color key for the RGB reference sheet; replace with a true alpha asset later.
void fragment(){ vec4 c=texture(TEXTURE,UV); bool bg=c.r>0.29 && c.b>=c.r-0.012 && abs(c.r-c.g)<0.11; if(bg){c.a=0.0;} COLOR=c; }
