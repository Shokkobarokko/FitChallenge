import UIKit

enum Role: String {
    case user = "user"
    case coach = "coach"
}

final class RegisterViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var userRoleButton: UIButton!
    @IBOutlet var coachRoleButton: UIButton!
    
    
    private var selectedRole: String = "user"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        selectRole(.user)
    }
    
    private func setupUI() {
        errorLabel.isHidden = true
        
        registerButton.layer.cornerRadius = 8
        
        userRoleButton.layer.cornerRadius = 8
        userRoleButton.layer.borderWidth = 2
        
        coachRoleButton.layer.cornerRadius = 8
        coachRoleButton.layer.borderWidth = 2
        
        [
            nameTextField,emailTextField,passwordTextField,confirmPasswordTextField
        ].forEach {
            $0?.layer.cornerRadius = 8
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.systemGray4.cgColor
            $0?.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: 0))
            
            $0?.leftViewMode = .always
        }
    }
    
    // MARK: - Actions
    @IBAction func userRoleTapped(_ sender: UIButton) {
        selectRole(.user)
    }
    
    @IBAction func coachRoleTapped(_ sender: UIButton) {
        selectRole(.coach)
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard validateForm() else {return}
        
        AuthManager.shared.saveUser(
            email: emailTextField.text!.trimmingCharacters(in: .whitespaces),
            name: nameTextField.text!.trimmingCharacters(in: .whitespaces),
            role: selectedRole
        )
        goToMainApp()
        
    }
    
    
    private func selectRole(_ role: Role) {
        selectedRole = role.rawValue
        
        switch role {
        case .user:
            userRoleButton.layer.borderColor = UIColor.systemBlue.cgColor
            userRoleButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
            userRoleButton.setTitleColor(.systemBlue, for: .normal)
            
            coachRoleButton.layer.borderColor = UIColor.systemGray4.cgColor
            coachRoleButton.backgroundColor = .clear
            coachRoleButton.setTitleColor(.systemGray, for: .normal)
            
        case .coach:
            coachRoleButton.layer.borderColor = UIColor.systemGreen.cgColor
            coachRoleButton.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.1)
            coachRoleButton.setTitleColor(.systemGreen, for: .normal)
            
            userRoleButton.layer.borderColor = UIColor.systemGray4.cgColor
            userRoleButton.backgroundColor = .clear
            userRoleButton.setTitleColor(.systemGray, for: .normal)
        }
    }
    
    private func validateForm() -> Bool {
        errorLabel.isHidden = true
        
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces),!name.isEmpty else {
            showError("Введите имя")
            return false
        }
        
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty else {
            showError("Введите email")
            return false
        }
        
        if !isValidEmail(email) {
            showError("Введите корректный email")
            return false
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showError("Введите пароль")
            return false
        }
        
        if password.count < 6 {
            showError("Пароль должен быть минимум 6 символов")
            return false
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            showError("Подтвердите пароль")
            return false
        }
        
        if password != confirmPassword {
            showError("Пароли не совпадают")
            return false
        }
        
        return true
    }
    
    private func goToMainApp() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController
        
        if selectedRole == "coach" {
            print("Открываю CoachTabBarController")
            viewController = storyBoard.instantiateViewController(withIdentifier: "CoachTabBarController")
        } else {
            print("Открываю MainTabBarController")
            viewController = storyBoard.instantiateViewController(withIdentifier: "MainTabBarController")
        }
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first {
                   window.rootViewController = viewController
                   UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
               }
    }
    
    private func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    
}
