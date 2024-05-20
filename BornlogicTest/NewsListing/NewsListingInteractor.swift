//Created by Lugalu on 13/05/24.

import UIKit

class NewsListingInteractor: NewsListingInteractorProtocol {
    var presenter: (any NewsListingPresenterProtocol)?
    var service: NetworkProtocol?
    
    func makeNewsRequest() {
//        Task(priority: .userInitiated){ [weak self] in
//            do{
//                guard let result = try await self?.service?.downloadNews() else {
//                    throw NetworkErrors.invalidResponse
//                }
//                DispatchQueue.main.async { [weak self] in
//                    self?.presenter?.finishedDowloading(result)
//                }
//            }catch{
//                print(error.localizedDescription)
//                DispatchQueue.main.async { [weak self] in
//                    self?.presenter?.failedToDownloadNews()
//                }
//                
//            }
//        }
        
        let arr: Array<NewsResult> = [
            NewsResult(source: Source(),author: "Lugalu", title: "POR QUE MARIA",description: "I've Been there", content: "ASJKHASJKDHAKJSHDJKA"),
            NewsResult(source: Source(),author: "Loane", title: "JUST GET OUT OF MY WAY", content: 
                        """
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

                        """
                      ),
            NewsResult(source: Source(),author: "Marcos", title: "WE WILL DANCE WITH DESTINY",description: "We can save the day", content: "dajshkjdsahfklasdjklhjkals"),
            NewsResult(source: Source(),author: "Marcos", title: "WE WILL DANCE WITH DESTINY",description: "We can save the day", content: "dajshkjdsahfklasdjklhjkals"),
            NewsResult(source: Source(),author: "Marcos", title: "WE WILL DANCE WITH DESTINY",description: "We can save the day", content: "dajshkjdsahfklasdjklhjkals"),
            NewsResult(source: Source(),author: "Marcos", title: "WE WILL DANCE WITH DESTINY",description: "We can save the day", content: "dajshkjdsahfklasdjklhjkals"),
            NewsResult(source: Source(),author: "Marcos", title: "WE WILL DANCE WITH DESTINY",description: "We can save the day", content: "dajshkjdsahfklasdjklhjkals"),
            NewsResult(source: Source(),author: "Marcos", title: "WE WILL DANCE WITH DESTINY",description: "We can save the day", content: "dajshkjdsahfklasdjklhjkals"),
            NewsResult(source: Source(),author: "Marcos", title: "WE WILL DANCE WITH DESTINY",description: "We can save the day", content: "dajshkjdsahfklasdjklhjkals"),
            NewsResult(source: Source(),author: "Marcos", title: "WE WILL DANCE WITH DESTINY",description: "We can save the day", content: "dajshkjdsahfklasdjklhjkals"),
        ]
        
        let r = arr.map({ return NewsEntity(result: $0) })
       
        presenter?.finishedDowloading(r);
        
    }
    
    func makeImageRequests(url: URL) async throws -> UIImage? {
            guard let result = try await self.service?.downloadImage(for: url) else {
                return nil
            }
            return result
        
    }
    
    
}
