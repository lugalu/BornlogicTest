//Created by Lugalu on 13/05/24.

import Foundation

enum NetworkErrors: LocalizedError {
    case invalidURL
    case invalidResponse
    
    var errorDescription: String?{
        switch self {
        case .invalidURL:
            return "The provided url is not valid!"
        case .invalidResponse:
            return "The server returned an error!"
        }
    }
    
}
