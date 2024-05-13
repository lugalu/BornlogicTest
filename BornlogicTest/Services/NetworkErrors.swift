//Created by Lugalu on 13/05/24.

import Foundation

enum NetworkErrors: LocalizedError {
    case invalidURL
    
    var errorDescription: String?{
        switch self {
        case .invalidURL:
            return "The provided url is not valid!"
        }
    }
    
}
