import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var button1: UIButton = FlagButton(flag: "us", tag: 0)
    private lazy var button2: UIButton = FlagButton(flag: "us", tag: 1)
    private lazy var button3: UIButton = FlagButton(flag: "us", tag: 2)
    
    var countries = [String]()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureUI()
    }
    
    // MARK: - Helpers
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Which Flag"
    }
    
    func configureUI() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            button1.widthAnchor.constraint(equalToConstant: 200),
            button1.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            button2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            button3.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 30),
            button3.widthAnchor.constraint(equalToConstant: 200),
            button3.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    // MARK: Actions
    @objc func buttonTapped(_ sender: UIButton) {
        print("Button: \(sender.tag)")
        askQuestion()
    }
}
