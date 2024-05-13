//Created by Lugalu on 13/05/24.

import UIKit

struct APIResult: Decodable{
    var status: String?
    var totalResults: Int?
    var articles: Array<NewsResult?>
}

struct NewsResult: Decodable{
    var source: Source?
    var author: String?
    var title: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?
}

struct Source: Decodable{
    var id: String?
    var name: String?
}

class NewsEntity {
    var source: Source?
    var author: String?
    var title: String?
    var url: URL?
    var urlToImage: URL?
    var publishedAt: Date?
    var content: String?
    
    var image: UIImage? = nil
    
    init(result: NewsResult) {
        self.source = result.source
        self.author = result.author
        self.title = result.title
        self.url = URL(string: result.url ?? "")
        self.urlToImage = URL(string: result.urlToImage ?? "")
        self.content = result.content
        
    }
    
    func convertToDate(_ stringDate: String?){
        guard let stringDate else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS'Z'"
    }
    
}
