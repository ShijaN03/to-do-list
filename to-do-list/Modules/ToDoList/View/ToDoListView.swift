import UIKit
import SnapKit

final class ToDoListView: UIViewController {

    var presenter: ToDoListPresenterProtocol?
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUpUI()
        presenter?.viewDidLoad()
    }
    
    private func setUpUI() {
        setUpTableView()
    }
    
    private func setUpTableView() {
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ToDoListCell.self, forCellReuseIdentifier: "ToDoCell")
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}



