import Foundation

struct ExampleAPI: RequestBuilder {
    let baseURL = "https://api.exemplo.com"
    let path: String
    let method: HTTPMethod
    let headers: [String: String]?
    let parameters: [String: Any]?
    
    // Exemplo de endpoint
    static func buscarUsuario(id: String) -> ExampleAPI {
        return ExampleAPI(
            path: "/usuarios/\(id)",
            method: .get,
            headers: ["Authorization": "Bearer seu-token"],
            parameters: nil
        )
    }
} 