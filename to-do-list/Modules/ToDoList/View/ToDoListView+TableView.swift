import UIKit

extension ToDoListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as? ToDoListCell else {
            return UITableViewCell()
        }
        
        guard let toDo = presenter?.toDo[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configure(
            id: toDo.id,
            todo: toDo.todo,
            description: "",
            completed: toDo.completed,
            userID: toDo.userId)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
