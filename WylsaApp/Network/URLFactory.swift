//
// Created by Dmitrii Space on 2019-07-28.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import Foundation

enum URLFactory {
    private static let apiKey = "7ba646457e7a40b29f317b2e43b5081f"
    private static var baseUrl: URL {
        return baseUrlComponents.url!
    }
    private static let baseUrlComponents: URLComponents = {
        let url = URL(string: "https://newsapi.org/v2/")!
        let queryItem = URLQueryItem(name: "apiKey", value: URLFactory.apiKey)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [queryItem]
        return urlComponents
    }()

    static func articles(params: ArticlesRequestParams) -> String {
        let params = [URLQueryItem(name: "pageSize", value: "\(params.pageSize)"),
                      URLQueryItem(name: "page", value: "\(params.page)"),
                      URLQueryItem(name: "q", value: params.search)]
        var urlComponents = baseUrlComponents
        urlComponents.queryItems?.append(contentsOf: params)
        return urlComponents.url!.appendingPathComponent("everything").absoluteString
    }
}
