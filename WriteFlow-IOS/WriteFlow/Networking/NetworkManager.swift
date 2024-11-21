
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://writeflowbackend.onrender.com"

    func sendRequest<T: Decodable>(endpoint: String, method: String, body: Data? = nil, token: String? = nil, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        if let body = body {
            request.httpBody = body
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error)
                return
            }

            guard let data = data else { return }
            do {
                print(data)
                let decodedResponse = try JSONDecoder().decode(responseType, from: data)
                completion(.success(decodedResponse))
            } catch {
                print("Error")
                completion(.failure(error))
            }
        }.resume()
    }
}
