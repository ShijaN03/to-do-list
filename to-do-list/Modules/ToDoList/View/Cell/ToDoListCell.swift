import UIKit

class ToDoListCell: UITableViewCell {
    
    static let identifier = "ToDoCell"
    
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: ToDoListCell.identifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(id: Int, todo: String, description: String, completed: Bool, userID: Int) {
        titleLabel.text = todo
    }
    
    private func setUpUI() {
        setUpTitle()
        
        contentView.backgroundColor = .black
        
    }
    
    private func setUpTitle() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.textColor = .white
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp_leadingMargin).offset(20)
            make.top.equalTo(contentView.snp_topMargin).offset(20)
        }
    }
    
}
