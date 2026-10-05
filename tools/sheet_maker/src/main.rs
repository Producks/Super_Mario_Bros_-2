mod config;

use config::Config;
use std::fs;

fn main() -> Result<(), Box<dyn std::error::Error>> {
  let file: String = fs::read_to_string("Config.toml")?;
  let config: Config = toml::from_str(&file)?;
  println!("{:#02x?}", config.tiles.tilequads1);
  Ok(())
}
