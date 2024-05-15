//Created by Lugalu on 13/05/24.

import UIKit

class NewsListingInteractor: NewsListingInteractorProtocol {
    var presenter: (any NewsListingPresenterProtocol)?
    var service: NetworkProtocol?
    
    func makeNewsRequest() {
        Task(priority: .userInitiated){ [weak self] in
            do{
                guard let result = try await self?.service?.downloadNews() else {
                    throw NetworkErrors.invalidResponse
                }
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.finishedDowloading(result)
                }
            }catch{
                print(error.localizedDescription)
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.failedToDownloadNews()
                }
                
            }
        }
    }
    
    func makeImageRequests(url: URL) async throws -> UIImage? {
            guard let result = try await self.service?.downloadImage(for: url) else {
                return nil
            }
            return result
        
    }
    
    
}
