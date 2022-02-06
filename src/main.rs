use crate::texture_atlas::TextureAtlasData;

mod texture_atlas;

fn main() {
    let atlas = TextureAtlasData::load_from_file("h:/sprites/out/texture_atlas.ron");
    println!("{:#?}", atlas);
}
