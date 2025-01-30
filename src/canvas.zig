const std = @import("std");

extern fn consoleLog(arg: u32) void;

const ww: u32 = 800;
const hh: u32 = 800;

export fn getWidth() u32 {
    return ww;
}
export fn getHeight() u32 {
    return hh;
}

var buffer = std.mem.zeroes(
    [ww][hh][4]u8,
);

// The returned pointer will be used as an offset integer to the wasm memory
export fn getBufferPointer() [*]u8 {
    return @ptrCast(&buffer);
}

export fn drawRect(x: u32, y: u32, w: u32, h: u32, color: u8) void {
    for (y..(y + h)) |yy| {
        for (x..(x + w)) |xx| {
            buffer[yy][xx][0] = color; // R
            buffer[yy][xx][1] = color; // G
            buffer[yy][xx][2] = color; // B
            buffer[yy][xx][3] = 255; // A
        }
    }
}
