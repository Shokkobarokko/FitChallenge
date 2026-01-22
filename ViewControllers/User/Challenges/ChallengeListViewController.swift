//
//  ChallengeListViewController.swift
//  FitChallenge
//
//  Created by Аветис Парсаданян on 1/5/26.
//

import UIKit

final class ChallengeListViewController: UITableViewController {
    
    private let testChallenges = [
        "30 дней приседаний",
        "Утренняя зарядка 21 день",
        "Йога для начинающих",
        "Беговой марафон 5км",
        "Питание без сахара",
        "Медитация на месяц",
        "Выпей два литра воды в день",
        "10 тысяч шагов ежедневно"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Каталог марафонов"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Выйти",
            style: .plain,
            target: self,
            action: #selector(logoutTapped)
        )
    }
    
 
}

//MARK: - UITableViewDataSource
extension ChallengeListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testChallenges.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ChallengeCell"

        // Ensure a cell is registered and dequeued
        if tableView.dequeueReusableCell(withIdentifier: identifier) == nil {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        cell.textLabel?.text = testChallenges[indexPath.row]
        cell.detailTextLabel?.text = "Длительность: 30 дней, - Цена: бесплатно"
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ChallengeListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedChallenge = testChallenges[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        showAlert(title: "Марафон выбран", message: "Вы выбрали марафон \(selectedChallenge)")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK: - Actions
    @objc private func logoutTapped() {
        let alert = UIAlertController(title: "Выйти?", message: "Вы действительно хотите выйти?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alert.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: { _ in
            AuthManager.shared.logout()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let welcomeVC = storyboard.instantiateInitialViewController()
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = welcomeVC
            }
        }))
        present(alert, animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

