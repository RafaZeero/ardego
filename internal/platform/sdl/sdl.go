package sdl

/*
#cgo pkg-config: sdl3
#cgo CFLAGS: -Wall -Wextra

#include "sdl.h"
*/
import "C"

import "fmt"

func Run() error {
	if rc := C.engine_sdl_run(0, nil); rc != 0 {
		return fmt.Errorf("sdl exited with code %d", int(rc))
	}
	return nil
}
