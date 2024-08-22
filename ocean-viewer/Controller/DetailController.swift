import UIKit

class DetailController: UIViewController {
    // MARK: - Properties
    var picture: Picture?
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadPicture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // MARK: - Helpers
    func configureUI() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        title = "Image View"
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func loadPicture() {
        if let imageName = picture?.path {
            if let path = Bundle.main.path(forResource: imageName, ofType: nil, inDirectory: "Pictures"),
               let image = UIImage(contentsOfFile: path) {
                imageView.image = image
            } else {
                print("Failed to load image: \(imageName)")
            }
        } else {
            print("No image name provided.")
        }
    }
}
