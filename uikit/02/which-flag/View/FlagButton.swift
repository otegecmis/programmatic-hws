import UIKit

class FlagButton: UIButton {
    
    init(flag: String, tag: Int) {
        super.init(frame: .zero)
        
        self.imageView?.contentMode = .scaleToFill
        self.setImage(UIImage(named: flag), for: .normal)
        self.tag = tag
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
