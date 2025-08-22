import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    var container: NSPersistentContainer
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init(modelName: String = "Model") {
        container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { desc, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func save() {
        if context.hasChanges {
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    func performBackground(block: @escaping(NSManagedObjectContext) -> Void) {
        
        container.performBackgroundTask { context in
            block(context)
        }
    }
    
}
