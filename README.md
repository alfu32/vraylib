# update
- updated to v 0.4.11 annotations
# Vraylib
a v wrapper for the awesome raylib library
# Platforms
it works on every 64bit platform if your platform does not work please contact me to help fix it or add it

# Android!!
for now you can use `v -o <name.c> ` when you compile and follow the raylib wiki on how to compile for android just use the generated c file as src code


--I am planning on making vab works with it so for the time been try to not break your pc while compiling it yourself--

--one thing I can assure you is that it works and it worked for me so it will work for you--


# Install
`v install alfu32.vraylib`

# Example
```
module main

import alfu32.vraylib as raylib




fn main() {
	raylib.init_window(800, 450, c'raylib [core] example - basic window')

	for !raylib.window_should_close() {
		raylib.begin_drawing()
		raylib.clear_background(raylib.white)
		raylib.draw_text(c'hello',10,10,16,raylib.black)
		raylib.end_drawing()
	}

	raylib.close_window()
}

```
