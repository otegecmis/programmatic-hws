import UIKit

class DetailController: UIViewController {
    // MARK: - Properties
    var picture: Picture?
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
}
