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
            URLQueryItem(name: "country", value: "us")
        ]
        
        url.append(queryItems: queryItems)
        
        var request = URLRequest(url: url)
        guard
            let dict =  Bundle.main.infoDictionary,
            var key = dict["API_KEY"] as? String else{
            throw NetworkErrors.invalidResponse
        }
        
        key = key.filter({
            !["'", "/"].contains($0)
        })
        
        request.setValue(key, forHTTPHeaderField: "Authorization")
        
        let (data,response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkErrors.invalidResponse
        }
                
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let result = try decoder.decode(APIResult.self, from: data)
        
        guard result.status == "ok" else {
            throw NetworkErrors.invalidResponse
        }
        
        return result.articles
            .filter({$0 != nil})
            .map({ NewsEntity(result: $0!) })
    }
    
    func downloadImage(for url: URL) async throws -> UIImage? {
        let request = URLRequest(url: url)
        let (data,response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkErrors.invalidResponse
        }
        
        return UIImage(data: data)
    }
}
