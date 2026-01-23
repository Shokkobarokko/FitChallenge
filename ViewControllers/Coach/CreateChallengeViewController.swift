import UIKit

final class CreateChallengeViewController: UIViewController {
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        title = "Создать марафоны"
        view.backgroundColor = .systemBackground
        
        let label = UILabel()
        label.text = "Форма создания марафона"
        label.textAlignment = .center
        label .translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
    
