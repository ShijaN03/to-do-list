import Foundation
import Alamofire

class APIService: APIServiceProtocol {
    
    func fetchData(completion: @escaping (Result<APIResponse,Error>) -> Void) {
        
        let url = "https://dummyjson.com/todos"
        
        AF.request(url)
            .validate()
            .responseDecodable(of: APIResponse.self) { response in
                
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                    return
                case .failure(let error):
                    completion(.failure(error))
                    return
                }
            }
    }
    
    
}
