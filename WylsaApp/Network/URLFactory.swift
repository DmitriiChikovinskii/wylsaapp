//
// Created by Dmitrii Space on 2019-07-28.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import Foundation

struct URLFactory {
    private static let apiKey = "7ba646457e7a40b29f317b2e43b5081f"
    private let urlComponents: URLComponents

    let articles: String

    init(baseURL: URL = URL(string: "https://newsapi.org/v2/")!) {
        let queryItem = URLQueryItem(name: "apiKey", value: URLFactory.apiKey)
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [queryItem]
        self.urlComponents = urlComponents
        self.articles = urlComponents.url!.appendingPathComponent("everything").absoluteString
    }
}
