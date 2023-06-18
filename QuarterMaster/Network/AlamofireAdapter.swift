import Foundation
import Alamofire

public final class NetworkAdapter: BaseNetworkAdapter {
    
    var baseUrl: String = ""
    var headers: HTTPHeaders = [:]

    public static let shared = NetworkAdapter()
    private init() {
        self.headers["Accept"] = "application/json"
    }

    public func setBaseUrl(_ url: String) {
        self.baseUrl = url
    }
    
    public func setAuthToken(_ token: String) {
        self.headers["Authorization"] = "Bearer \(token)"
    }
    
    public func request<T: Codable>(_ endpoint: String,
                             method: HTTPMethod = .get,
                             parameters: Parameters? = nil,
                             encoding: ParameterEncoding = URLEncoding.default,
                             completion: @escaping (Response<T>) -> Void) {
        
        let url = "\(baseUrl)/\(endpoint)"
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

// MARK: -
extension HTTPHeaders: NetworkRequestHeaders {}
