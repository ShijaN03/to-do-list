protocol APIServiceProtocol: AnyObject {
    
    func fetchData(completion: @escaping (Result<APIResponse, Error>) -> Void)
}

