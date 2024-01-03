final class AphroditeToken: Token {
    let color: ColorToken = AphroditeToken.Color()
    
    struct Color: ColorToken {
        let background = RGBA(r: 39, g: 39, b: 42)
        let muttedBackground = RGBA(r: 39, g: 39, b: 42)
        let highlightBackground = RGBA(r: 63, g: 63, b: 70)
        
        let foreground = RGBA(r: 238, g: 238, b: 238)
        let muttedForeground = RGBA(r: 185, g: 185, b: 192)
        let highlightForeground = RGBA(r: 245, g: 245, b: 245)
        
        let accent = RGBA(r: 113, g: 87, b: 212)
        let muttedAccent = RGBA(r: 80, g: 60, b: 151)
        let highlightAccent = RGBA(r: 148, g: 142, b: 235)
    }
}
