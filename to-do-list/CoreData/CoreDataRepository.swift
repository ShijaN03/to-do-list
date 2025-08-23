import CoreData

protocol CoreDataRepositoryProtocol: AnyObject {
    func replaceAll(tasks: [TaskModel], completion: @escaping(NSManagedObjectContext) -> Void)
    func saveAll(tasks: [TaskModel], completion: @escaping(NSManagedObjectContext) -> Void)
    func fetchAll(completion: @escaping(NSManagedObjectContext) -> Void) -> [ToDo]
}

final class CoreDataRepository: CoreDataRepositoryProtocol {
    
    private let core = CoreDataManager.shared
    
    func fetchAll(completion: @escaping(NSManagedObjectContext) -> Void) -> [ToDo] {
        
        var tasks: [ToDo] = []
        let request = NSFetchRequest<Task>(entityName: "Task")
        
        do {
            let objects = try core.context.fetch(request)
            
            tasks = objects.map {
                ToDo(
                    id: Int($0.id),
                    title: $0.title ?? "",
                    details: $0.details,
                    createdAt: $0.createdAt ?? Date(),
                    isCompleted: $0.isCompleted,
                    userId: Int($0.userId)
                )
            }
            
        } catch {
            
            print(error)
        }
        
        return tasks
    }
    
    func saveAll(tasks: [TaskModel], completion: @escaping (NSManagedObjectContext) -> Void) {
        
    }
    
    func replaceAll(tasks: [TaskModel], completion: @escaping(NSManagedObjectContext) -> Void) {
        
       
    }
    
    
}
