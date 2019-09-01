//
// Created by Dmitrii Space on 2019-07-28.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import Foundation

protocol HasArticlesNetworkService {
    var articlesNetworkService: ArticlesNetworkProtocol { get }
}

class AppDependency {
    let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    static func makeDefault() -> AppDependency {
        let networkService = NetworkService()
        return AppDependency(networkService: networkService)
    }
}

extension AppDependency: HasArticlesNetworkService {
    var articlesNetworkService: ArticlesNetworkProtocol {
        return self.networkService
    }
}
