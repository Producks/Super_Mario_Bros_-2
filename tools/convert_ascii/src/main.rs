use std::{env};

const STARTING_NUMERICAL: u8 = 0xD0;
const STARTING_CHARACTER: u8 = 0xDA;
const STARTING_ASCII_NUMERICAL: u8 = 48;
const STARTING_ASCII_UP_CHARACTER: u8 = 65;
const STARTING_ASCII_LOW_CHARACTER: u8 = 97;

fn format(ascii : String) {
  let mut result: String = format!("  .db $XX, $XX, ${:02X},", ascii.len());
  for c in ascii.chars() {
    let value;
    if char::is_numeric(c) {
      value = (c as u8 - STARTING_ASCII_NUMERICAL) + STARTING_NUMERICAL;
    } else if char::is_ascii_uppercase(&c) {
      value = (c as u8 - STARTING_ASCII_UP_CHARACTER) + STARTING_CHARACTER;
    } else if char::is_ascii_lowercase(&c) {
      value = (c as u8 - STARTING_ASCII_LOW_CHARACTER) + STARTING_CHARACTER;
    } else {
      value = 0xFB; // Space
    }
    result.push_str(&format!(" ${:X},", value));
  }
  result.push_str(" $00"); // Terminating 0
  print!("{}", result);
}

fn main() {
  let args: Vec<String> = env::args().collect();

  for arg in args.into_iter().skip(1) {
    format(arg);
  }
}
