
var exportSprites = function(root)
{
	var textures = root.allResults[root.variantIndex].textures
	var result = "\tsprites: [\n";

    for (var texture_index = 0; texture_index < textures.length; texture_index++)
    {
        var texture = textures[texture_index];
		var sprites = texture.allSprites;
		for (var sprite_index = 0; sprite_index < sprites.length; sprite_index++)
		{
			var sprite = sprites[sprite_index];
			result += "\t\t(\n";
			result += "\t\t\tsprite_name: \"" + strip_tail(sprite.trimmedName) + "\",\n";
			result += "\t\t\ttexture: \"" + texture.fullName + "\",\n";
			result += "\t\t\tindex: " + get_tail_numbers(sprite.trimmedName) + ",\n";
			result += "\t\t\tuntrimmedSize: " + size_to_string(sprite.untrimmedSize) + ",\n";
			result += "\t\t\trect: " + rect_to_string(sprite.frameRect) + ",\n";
			result += "\t\t\tsource: " + rect_to_string(sprite.sourceRect) + ",\n";
			result += "\t\t\trotated: " + sprite.rotated + ",\n";
			result += "\t\t\talias_count: \"" + sprite.aliasList.length + "\",\n";
			result += "\t\t),\n";
		}
	}

    return result + "\n]";
}


var exportTexture = function(root)
{
    var textures = root.allResults[root.variantIndex].textures;
    var result = "TextureAtlasData (\n\ttextures: [\n";

    for (var texture_index = 0; texture_index < textures.length; texture_index++)
    {
        var texture = textures[texture_index];
		result += "\t\t(\n";
		result += "\t\t\tfile_name: \"" + texture.fullName + "\",\n";
		result += "\t\t\tsize: ( width: " + texture.size.width + ", height: " + texture.size.height + "),\n";
		result += "\t\t\tformat: " + root.settings.outputFormat + ",\n";
		result += "\t\t),\n";
    }
	
    return result + "  ],\n" + exportSprites(root) + "\n)";
}

var rect_to_string = function(rect)
{
	return "(x:"+rect.x+", y:"+rect.y+", width:"+rect.width+", height:"+rect.height+")";
}

var point_to_string = function(point)
{
	return "(x:"+point.x+", y:"+point.y+")";
}

var size_to_string = function(size)
{
	return "(width:"+size.width+", height:"+size.height+")";
}


var strip_tail = function(string)
{
	return string.replace(/[\W_]+\d+$/, "");
}

var get_tail_numbers = function(string)
{
	var tail = string.replace(strip_tail(string), "").replace(/[\W_]+/, "");
	
	return (tail.length == 0 ? -1 : parseInt(tail));
}

var exportData = function(root)
{
    return exportTexture(root);
}
exportData.filterName = "exportData";
Library.addFilter("exportData");

