
import Foundation

extension NetworkService: ArticlesNetworkProtocol {
    func requestArticles(params: ArticlesRequestParams,
                         completion: @escaping (Result<ArticlesResponse, Error>) -> Void) {
        let url = URLFactory.articles(params: params)
        self.baseRequest(url: url, completion: completion)
    }
}