import UIKit

class ToDoListCell: UITableViewCell {
    
    static let identifier = "ToDoCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: ToDoListCell.identifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(id: Int, todo: String, completed: Bool, userID: Int) {
        self.textLabel?.text = todo
    }
    
    private func setUpUI() {
        
    }
    
    
}
