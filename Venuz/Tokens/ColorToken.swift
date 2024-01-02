protocol ColorToken {
    var background: RGBA { get }
    var foreground: RGBA { get }
}

struct RGBA {
    let r: UInt8
    let g: UInt8
    let b: UInt8
}
