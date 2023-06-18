import Foundation
import Alamofire

protocol NetworkRequestHeaders {}

protocol BaseNetworkAdapter {
    associatedtype RequestHeaders: NetworkRequestHeaders
    
    var baseUrl: String { get }
    var headers: RequestHeaders { get set }
    
    func setAuthToken(_ token: String)
    func request<T: Codable>(_ endpoint: String,
                             method: HTTPMethod,
                             parameters: Parameters?,
                             encoding: ParameterEncoding,
                             completion: @escaping (Response<T>) -> Void)
}

public enum Response<T> {
    case success(T)
    case failure(Error)
}
