import UIKit

class StartViewController: UIViewController {
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(CommonStrings.start, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(startButton)
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func didTapStartButton() {
       pushTabBarController()
    }

    func pushTabBarController() {
        let tabBarController = TabBarController(nibName: nil, bundle: nil)
        navigationController?.pushViewController(tabBarController, animated: true)
    }
}
