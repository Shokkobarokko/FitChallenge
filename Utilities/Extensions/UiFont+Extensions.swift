import UIKit

extension UIFont {
    // MARK: - Font Factory Methods
    static func regular(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func medium(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    static func semibold(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    // MARK: - Text Styles
    static let title1 = UIFont.bold(size: 28)
    static let title2 = UIFont.bold(size: 22)
    static let title3 = UIFont.bold(size: 20)
    
    static let body = UIFont.regular(size: 17)
    static let bodyBold = UIFont.semibold(size: 17)
    static let caption = UIFont.regular(size: 15)
    static let captionBold = UIFont.semibold(size: 15)
    static let small = UIFont.regular(size: 13)
}
