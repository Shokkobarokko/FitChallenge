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
        errorLabel.isHidden = true
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
