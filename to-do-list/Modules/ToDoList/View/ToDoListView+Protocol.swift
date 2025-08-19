extension ToDoListView: ToDoListViewProtocol {
    
    func displayData(data: [ToDoVM]) {
        tableView.reloadData()
    }
    
    func displayError(description: String) {
        tableView.reloadData()
    }
    
    
}
