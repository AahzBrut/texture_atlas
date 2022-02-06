use std::fs::File;
use std::path::Path;
use ron::de::from_reader;
use serde::Deserialize;

#[allow(dead_code)]
#[derive(Deserialize, Debug)]
pub enum TextureFormat {
    RGBA8888
}

#[allow(dead_code)]
#[derive(Deserialize, Debug)]
pub struct Size {
    width: usize,
    height: usize,
}

#[allow(dead_code)]
#[derive(Deserialize, Debug)]
pub struct TextureData{
    file_name: String,
    size: Size,
    format: TextureFormat,
}

#[allow(dead_code)]
#[derive(Deserialize, Debug)]
pub struct SpriteData{
    sprite_name: String,
    size: Size,
}

#[allow(dead_code, clippy::module_name_repetitions)]
#[derive(Deserialize, Debug)]
pub struct TextureAtlasData {
    textures: Vec<TextureData>,
    sprites: Vec<SpriteData>,
}

impl TextureAtlasData {
    pub fn load_from_file<P: AsRef<Path>>(path: P) -> Self {
        let file = File::open(path)
            .expect("Failed opening templates file");

        from_reader(file)
            .expect("Unable to load template")
    }
}