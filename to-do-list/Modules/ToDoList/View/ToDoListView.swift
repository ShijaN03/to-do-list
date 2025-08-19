import UIKit
import SnapKit

final class ToDoListView: UIViewController {

    var presenter: ToDoListPresenterProtocol?
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
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
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}



