//
//  ProfileViewController.swift
//  FitChallenge
//
//  Created by Аветис Парсаданян on 1/5/26.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let roleLabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadUserData()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        title = "Профиль"
        view.backgroundColor = .systemBackground
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        emailLabel.textColor = .gray
        roleLabel.font = UIFont.systemFont(ofSize: 16)
        roleLabel.textColor = .systemBlue
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(roleLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate(
    [
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
        stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
    ]
    
    
        )
        
        let testButton = UIButton(type: .system)
        testButton.setTitle("Тестовая кнопка", for: .normal)
        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(testButton)
        
        NSLayoutConstraint.activate(
    [
        testButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ]
        )
    }
    
    // MARK: - Data
    private func loadUserData() {
        nameLabel.text = "Иван Иванов"
        emailLabel.text = "test@example.com"
        roleLabel.text = "Участник"
    }
    
    // MARK: - Actions
    @objc private func testButtonTapped() {
        print("Тестовая кнопка нажата")
        
        let alert  = UIAlertController(
            title: "Тест",
            message: "Кнопка работает",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert,animated: true)
    }
}

