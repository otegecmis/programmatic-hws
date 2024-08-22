import UIKit

private let reusableIdentifier = "PictureCell"

class HomeController: UITableViewController {
    // MARK: - Properties
    var pictures = [Picture]()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPictures()
        configureUI()
        configureTableView()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Ocean Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        tableView.register(PictureCell.self, forCellReuseIdentifier: reusableIdentifier)
    }
    
    func fetchPictures() {
        let fm = FileManager.default
        if let path = Bundle.main.resourcePath?.appending("/Pictures") {
            do {
                let items = try fm.contentsOfDirectory(atPath: path)
                for item in items {
                    if item.hasSuffix(".jpg") || item.hasSuffix(".jpeg") {
                        pictures.append(Picture(path: item))
                    }
                }
            } catch {
                print("Error fetching pictures: \(error)")
            }
        } else {
            print("Pictures folder not found.")
        }
    }
}

// MARK: - Extensions
extension HomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as? PictureCell else {
            fatalError("NOT FOUND: PictureCell")
        }
        
        cell.textLabel?.text = pictures[indexPath.row].path
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailController()
        controller.picture = pictures[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
