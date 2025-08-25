import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private var container: NSPersistentContainer
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
        container.viewContext.automaticallyMergesChangesFromParent = true
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
    
    func performBackground(block: @escaping(NSManagedObjectContext) throws -> Void, completion: @escaping(Result<Void, Error>) -> Void) {
        
        container.performBackgroundTask { context in
            
            context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
            do {
                try block(context)
                
                if context.hasChanges {
                    
                    try context.save()
                }
                
                DispatchQueue.main.async {
                    completion(.success(()))
                }
            } catch {
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func performBackground<T>(block: @escaping(NSManagedObjectContext) throws -> T, completion: @escaping(Result<T, Error>) -> Void) {
        
        container.performBackgroundTask { context in
            
            do {
                
                let value = try block(context)
                
                if context.hasChanges {
                    
                    try context.save()
                }
                
                DispatchQueue.main.async {
                    completion(.success(value))
                }
            } catch {
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
