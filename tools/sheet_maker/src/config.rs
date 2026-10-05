use serde::{Deserialize};
// use std::fs;

#[derive(Deserialize)]
pub struct Config {
  pub src_picture: String,
  pub background: ColorPalette,
  pub sprites: ColorPalette,
  pub tiles: Tiles,
}

#[derive(Deserialize)]
pub struct ColorPalette {
  pub one: [u8; 4],
  pub two: [u8; 4],
  pub three: [u8; 4],
  pub four: [u8; 4]
}

#[derive(Deserialize)]
pub struct Tiles {
  pub tilequads1: Vec<[u8; 4]>,
  pub tilequads2: Vec<[u8; 4]>,
  pub tilequads3: Vec<[u8; 4]>,
  pub tilequads4: Vec<[u8; 4]>,
}

// impl Config {
//   fn create_config(config_path: &str) -> Config {
//     // let
//   }
// }
