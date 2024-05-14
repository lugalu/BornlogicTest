//Created by Lugalu on 13/05/24.

import Foundation

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
    
    func makeImageRequests(url: URL, indexPath: IndexPath) {
        Task(priority: .userInitiated){ [weak self] in
            guard let result = try? await self?.service?.downloadImage(for: url) else {
                return
            }
            DispatchQueue.main.async {  [weak self] in
                self?.presenter?.finishedDowloading(image: result, forCell: indexPath)

            }
        }
    }
    
    
}
