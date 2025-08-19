import UIKit

extension ToDoListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.toDo.count ?? 0
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
            completed: toDo.completed,
            userID: toDo.userId)
        
        return cell
    }
    
    
}
