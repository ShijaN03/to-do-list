extension ToDoListView: ToDoListViewProtocol {

    func reload() {
        tableView.reloadData()
    }
    
    func displayError(description: String) {
        
    }
    

}
