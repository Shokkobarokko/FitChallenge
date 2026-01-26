//
//  LoginViewController.swift
//  FitChallenge
//
//  Created by Аветис Парсаданян on 1/5/26.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        view.endEditing(true)
        animateButton(sender)
        
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showError("Заполните все поля")
            return
        }
        
        if !email.contains("@") || !email.contains("."){
            showError("Введите корректный email")
            return
        }
        
        if password.count < 6 {
            showError("Пароль должен быть минимум 6 символов")
            return
        }
        
        AuthManager.shared
            .saveUser(
                email: email,
                name: "Пользователь",
                role: "user"
            )
        goToMainApp()
    }
}

//MARK: - Private UI
private extension LoginViewController {
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.errorLabel.isHidden = true
        }
    }
    
    func setupUI() {
        view.backgroundColor = .background
        title = "Вход"
        
        setupTextField(emailTextField, placeholder: "Email", icon: "envelope")
        setupTextField(passwordTextField, placeholder: "Password", icon: "lock", isSecure: true)
        errorLabel.isHidden = true
        
    }
    
    func setupTextField(
        _ textField: UITextField,
        placeholder: String,
        icon: String,
        isSecure: Bool = false
    ) {
        textField.placeholder = placeholder
        textField.font = .regular(size: 17)
        textField.backgroundColor = .cardBackground
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.isSecureTextEntry = isSecure
        
        //Indent
        textField.leftViewMode = .always
        let iconView = UIImageView(image: UIImage(systemName: icon))
        iconView.tintColor = .systemGray
        iconView.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        iconView.contentMode = .scaleAspectFit
        textField.leftView = iconView
        
        textField.addTarget(self, action: #selector(textFieldDidChangeSelection), for: .editingChanged)
    }
    
    func addGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.gradientStart.cgColor, UIColor.gradientEnd.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.bounds
        gradientLayer.opacity = 0.1
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) {_ in
            UIView.animate(withDuration: 0.1) {
                button.transform = .identity
            }
        }
    }
    
    @objc private func textFieldDidChangeSelection() {
        errorLabel.isHidden = true
        
        UIView.animate(withDuration: 0.2) {
            self.emailTextField.layer.borderColor = UIColor.systemGray5.cgColor
            self.passwordTextField.layer.borderColor = UIColor.systemGray5.cgColor
        }
    }
    
    func showErrorWithAnimation(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
        
        errorLabel.transform = CGAffineTransform(translationX: 0, y: -10)
        errorLabel.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) {
            self.errorLabel.transform = .identity
            self.errorLabel.alpha = 1
            
            self.emailTextField.layer.borderColor = UIColor.error.cgColor
        }
    }
    
    func performLogin(email: String, password: String) {
        loginButton.isEnabled = false
        loginButton.setTitle("", for: .disabled)
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            self.loginButton.isEnabled = true
            self.loginButton.setTitle("Войти", for: .normal)
        }
    }
    
}

//MARK: - Navigation
private extension LoginViewController {
    
    func goToMainApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = mainVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
            
           
        }
    }
}
