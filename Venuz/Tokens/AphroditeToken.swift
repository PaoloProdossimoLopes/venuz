final class AphroditeToken: Token {
    let color: ColorToken = AphroditeToken.Color()
    
    struct Color: ColorToken {
        let background = RGBA(r: 39, g: 39, b: 42)
        let foreground = RGBA(r: 218, g: 218, b: 218)
    }
}

