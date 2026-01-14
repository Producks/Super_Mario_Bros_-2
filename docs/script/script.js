const fileInput = document.getElementById('fileInput');
const patchInput = document.getElementById('patchInput');
const patchButton = document.getElementById('Patch');
const rom_name = document.getElementById('Rom-Text');
const patch_name = document.getElementById('Patch-Text');
const confirmation_rom = document.getElementById('Confirmation-Rom');
const confirmation_patch = document.getElementById('Confirmation-Patch');
const iNes1_0Header = [0x4E, 0x45, 0x53, 0x1A, 0x08, 0x10, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];
const iNes2_0Header = [0x4E, 0x45, 0x53, 0x1A, 0x08, 0x10, 0x40, 0x08, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x01];
const CRC32_1_0 = "7D3F6F3D";
const CRC32_2_0 = "43507232";
const CRC32_A_1_0 = "E0CA425C";
const CRC32_A_2_0 = "DEA55F53";
const INVALID_REV = -1;

var romFile;
var crc32HashRom;
var romRev;
var romLoaded = false;
var patch_file_name;
var bpsPatch;
var crc32BPS;
var patchRev;
var patchLoaded = false;

fileInput.addEventListener('change', async () => {
  const file = fileInput.files[0];
  if (!file)
    return;
  romFile = new BinFile(await file.arrayBuffer());
  romFile.setName(fileInput.files[0].name);
  crc32HashRom = romFile.hashCRC32().toString(16).padStart(8, "0").toUpperCase();

  romRev = get_rev(crc32HashRom);
  if (romRev == INVALID_REV) {
    confirmation_rom.style.display = "block";
    rom_name.textContent = "Upload SMB2 rom";
    patchButton.style.display = 'none';
    romLoaded = false;
    return;
  }
  confirmation_rom.style.display = "none";
  rom_name.textContent = romFile.getName();
  romLoaded = true;
  patchButton.style.display = (patchLoaded && romLoaded) ? 'flex' : 'none';
});

patchInput.addEventListener('change', async () => {
  const file = patchInput.files[0];
  if (!file)
    return;
  try {
    const bpsFile = new BinFile(await file.arrayBuffer());
    patch_file_name = patchInput.files[0].name;
    console.log(patchInput.files[0].name);
    bpsPatch = BPS.fromFile(bpsFile);
    crc32BPS = bpsPatch.sourceChecksum.toString(16).toUpperCase().padStart(8, '0');
    console.log(crc32BPS);
  } catch (e) {
    console.log(e);
  }
  patchRev = get_rev(crc32BPS);
  if (patchRev == INVALID_REV) {
    patch_name.textContent = "Upload BPS patch";
    patchLoaded = false;
    patchButton.style.display = 'none';
    return;
  }
  patch_name.textContent = patch_file_name;
  patchLoaded = true;
  patchButton.style.display = (patchLoaded && romLoaded) ? 'flex' : 'none';
});

patchButton.addEventListener('click',  async() => {
  await validate_rom();
  var newFile = bpsPatch.apply(romFile);
  newFile.fileName = patch_file_name.replace(/\.bps$/i, "") + ".nes";
  newFile.save();
});

async function validate_rom() {
  if (crc32HashRom == crc32BPS)
    return;
  swapHeader(iNes1_0Header);
  if (patchRev != romRev)
    await swap_rev();
  if (crc32HashRom != crc32BPS)
    swapHeader(iNes2_0Header);
}

function swapHeader(header) {
  romFile.swapHeader(header);
  crc32HashRom = romFile.hashCRC32().toString(16).padStart(8, "0").toUpperCase();
}

async function swap_rev() {
  const revPatchFile  = await fetchPatch(romRev ? "./rev_0.bps" : "rev_a.bps");
  romFile = revPatchFile .apply(romFile);
  romRev = romRev ^ 1;
  crc32HashRom = romFile.hashCRC32().toString(16).padStart(8, "0").toUpperCase();
}

async function fetchPatch(patch_path) {
  const fetched_patch = await fetch(patch_path);
  return BPS.fromFile(new BinFile(await fetched_patch.arrayBuffer()));
}

function get_rev(crc32) {
  switch (crc32) {
    case CRC32_1_0:
    case CRC32_2_0:
     return 0;
    case CRC32_A_1_0:
    case CRC32_A_2_0:
      return 1;
    default:
      return -1;
  }
}
