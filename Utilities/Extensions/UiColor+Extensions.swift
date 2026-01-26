import UIKit

extension UIColor {
    // MARK: - Color Palette (Static Colors)
    static let primary = UIColor(hex:  "#4361EE")
    static let primaryLight = UIColor(hex: "#4895EF")
    static let secondary = UIColor(hex: "#3F37C9")
    static let accent = UIColor(hex: "#4CC9F0")
    
    static let background = UIColor.systemBackground
    static let cardBackground = UIColor(hex: "#F8F9FA")
    
    static let textPrimary = UIColor.label
    static let textSecondary = UIColor.secondaryLabel
    
    static let success = UIColor(hex: "#4CAF50")
    static let warning = UIColor(hex: "#FF9800")
    static let error = UIColor(hex: "#F44336")
    
    static let gradientStart = UIColor(hex: "#4361EE")
    static let gradientEnd = UIColor(hex: "#3A0CA3")
    
    // MARK: - Hex Initializer
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a,r,g,b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
