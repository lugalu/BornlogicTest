//Created by Lugalu on 14/05/24.

import UIKit

class ArticleInteractor: ArticleInteractorProtocol {
    var presenter: ArticlePresenterProtocol?
    var service: NetworkProtocol?
    
    func downloadImage(url: URL) async throws -> UIImage? {
        return try? await service?.downloadImage(for: url)
    }
}
