# Super Mario Bros. -2 
To learn what this project is about click [here for the website](https://producks.github.io/Super_Mario_Bros_-2/)

## How to Compile
Compiling is the same as the [smb2 disassembly](https://github.com/Xkeeper0/smb2)  
Run ``build.sh`` if you are on Linux or ``build.bat`` if you are on Windows.The compiled rom will be in the bin folder  

## Code
Some of the new code has comments and explanations about how it works, but a lot of code remains without explanations or comments. A lot of the code has been rewritten multiple times due to a change of ideas or console limitations and isn't "**clean**". But anyone familiar with assembly should be able to follow along the terrible decisions that I've made. I might do a cleanup in the future to make it "**clean**" and add comments so it's easier to follow.

Here are some location of where some of the code are located:  
[Title screen](https://github.com/Producks/Super_Mario_Bros_-2/tree/main/src/menu)  
[Option select](https://github.com/Producks/Super_Mario_Bros_-2/tree/main/src/menu)  
[Character select](https://github.com/Producks/Super_Mario_Bros_-2/tree/main/src/character-select)  
[Gameplay mode](https://github.com/Producks/Super_Mario_Bros_-2/blob/dd549bd2552fe4f8a6de3fa66765781480d35702/src/prg-e-f.asm#L5507) (A func pointer is set in RAM when picking a mode; this should always be called during gameplay.)  

A lot of the other code is sprinkled around everywhere in other files. If you can't find what you are looking for, you can always contact me directly.
