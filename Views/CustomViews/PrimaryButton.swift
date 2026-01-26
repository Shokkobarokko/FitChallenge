import UIKit

final class PrimaryButton: UIButton {
    // MARK: - Button Styles
    enum ButtonStyle {
        case primary
        case secondary
        case outline
    }
    
    // MARK: - Style Property
    var style: ButtonStyle = .primary {
        didSet {
            updateAppearance()
        }
    }
    
    // MARK: - Appearance
    private func updateAppearance() {
        switch style {
        case .primary:
            backgroundColor = .primary
            setTitleColor(.white, for: .normal)
            layer.borderWidth = 0
            layer.shadowColor = UIColor.primary.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowRadius = 8
            layer.shadowOpacity = 0.2
        case .secondary:
            backgroundColor = .primaryLight
            setTitleColor(.white, for: .normal)
            layer.borderWidth = 0
        case .outline:
            backgroundColor = .clear
            setTitleColor(.primary, for: .normal)
            layer.borderWidth = 2
            layer.borderColor = UIColor.primary.cgColor
        }
    }
    
    // MARK: - Highlight Animation
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.alpha = self.isHighlighted ? 0.7 : 1.0
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98)  : .identity
            }
        }
    }
}
