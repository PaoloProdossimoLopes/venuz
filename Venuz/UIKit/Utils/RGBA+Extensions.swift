import Foundation

extension RGBA {
    private var maxRGBValue: CGFloat { 255.0 }
    
    var uiColor: UIColor {
        UIColor(
            red: CGFloat(r) / maxRGBValue,
            green: CGFloat(g) / maxRGBValue,
            blue: CGFloat(b) / maxRGBValue,
            alpha: 1
        )
    }
}
