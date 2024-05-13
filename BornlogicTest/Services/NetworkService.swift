//Created by Lugalu on 13/05/24.

import UIKit

protocol NetworkProtocol{
    func downloadNews() async throws -> [NewsEntity]
    func downloadImage(for: URL) async throws -> UIImage?
}



class NetworkService: NetworkProtocol {
    static let shared: NetworkProtocol = NetworkService()
    
    private init(){}
    
    func downloadNews() async throws -> [NewsEntity] {
        guard var url = URL(string: "https://newsapi.org/v2/top-headlines") else {
            throw NetworkErrors.invalidURL
        }
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "country", value: "br")
        ]
        
        url.append(queryItems: queryItems)
        
        var request = URLRequest(url: url)
        request.setValue("API_KEY", forHTTPHeaderField: "Authorization")
        
        let (data,response) = try await URLSession.shared.data(for: request)
        
        
        return []
    }
    
    func downloadImage(for: URL) async throws -> UIImage? {
        
        return nil
    }
}
