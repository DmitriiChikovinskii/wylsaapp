//
// Created by Dmitrii Space on 2019-07-28.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import Foundation

struct ArticlesRequestParams {
    let pageSize: Int
    let page: Int
    let search: String
}

protocol ArticlesNetworkProtocol {
    func requestArticles(params: ArticlesRequestParams, completion: @escaping (Result<ArticlesResponse, Error>) -> Void)
}

struct ArticlesResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let identifier: String = UUID().uuidString
    let title: String?
    let description: String?
    let urlToImage: String?
    let content: String?
}
