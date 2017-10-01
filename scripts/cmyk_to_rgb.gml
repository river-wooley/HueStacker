//cmyk_to_rgba(var, var, var, var);
//Converts a CMYK value to RGB

var C = argument0, M = argument1, Y = argument2, K = argument3;

var red = 255 * (1 - C / 100) * (1 - K / 100);
var green = 255 * (1 - M / 100) * (1 - K / 100);
var blue = 255 * (1 - Y / 100) * (1 - K / 100);

var rgb;
rgb[0] = round(red);
rgb[1] = round(green);
rgb[2] = round(blue);

return rgb