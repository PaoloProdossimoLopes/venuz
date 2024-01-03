protocol ColorToken {
    var background: RGBA { get }
    var muttedBackground: RGBA { get }
    var highlightBackground: RGBA { get }
    
    var foreground: RGBA { get }
    var muttedForeground: RGBA { get }
    var highlightForeground: RGBA { get }
    
    var accent: RGBA { get }
    var muttedAccent: RGBA { get }
    var highlightAccent: RGBA { get }
}

struct RGBA {
    let r: CGFloat
    let g: CGFloat
    let b: CGFloat
}
