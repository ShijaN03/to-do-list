extension ToDoListView: ToDoListViewProtocol {
    
    func displayData(data: [ToDoVM]) {
        print(data)
    }
    
    func displayError(description: String) {
        print(description)
    }
    
    
}
