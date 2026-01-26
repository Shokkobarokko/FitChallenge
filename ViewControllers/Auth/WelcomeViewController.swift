import UIKit

// MARK: - WelcomeViewController
final class WelcomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var loginButton: PrimaryButton!
    @IBOutlet var registerButton: PrimaryButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addAnimations()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .background
        
        logoImageView.image = UIImage(systemName: "flame.fill")
        logoImageView.tintColor = .primary
        logoImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = "FitChallenge"
        titleLabel.font = .bold(size: 36)
        titleLabel.textColor = .textPrimary
        
        subtitleLabel.text = "Достигай целей вместе с нами"
        subtitleLabel.font = .regular(size: 17)
        subtitleLabel.textColor = .textSecondary
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        
        loginButton.style = .outline
        loginButton.setTitle("Войти", for: .normal)
        
        registerButton.style = .outline
        registerButton.setTitle("Регистрация", for: .normal)
    }
    
    // MARK: - Animations
    private func addAnimations() {
        logoImageView.transform = CGAffineTransform(translationX: 0, y: -50)
        logoImageView.alpha = 0
        
        titleLabel.transform = CGAffineTransform(translationX: 0, y: -30)
        titleLabel.alpha = 0
        
        subtitleLabel.transform = CGAffineTransform(translationX: 0, y: -20)
        subtitleLabel.alpha = 0
        
        loginButton.transform = CGAffineTransform(translationX: 0, y: -30)
        loginButton.alpha = 0
        
        registerButton.transform = CGAffineTransform(translationX: 0, y: 30)
        registerButton.alpha = 0
        
        UIView.animate(withDuration: 0.6, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5) {
            self.logoImageView.transform = .identity
            self.logoImageView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5) {
            self.titleLabel.transform = .identity
            self.titleLabel.alpha = 1
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5) {
            self.subtitleLabel.transform = .identity
            self.subtitleLabel.alpha = 1
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.4, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5) {
            self.loginButton.transform = .identity
            self.loginButton.alpha = 1
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5) {
            self.registerButton.transform = .identity
            self.registerButton.alpha = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("hello world")
        if segue.identifier == "showLogin" || segue.identifier == "showRegister" {
            UIView.animate(
                withDuration: 0.2) {
                    self.loginButton.alpha = 0.7
                    self.registerButton.alpha = 0.7
                }
        }
    }
}
