//
//  FeedInteractor.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 2019-06-30.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import Foundation

final class FeedInteractor {
	weak var output: FeedInteractorOutput?

	private let articlesNetworkService: ArticlesNetworkProtocol

	init(articlesNetworkService: ArticlesNetworkProtocol) {
		self.articlesNetworkService = articlesNetworkService
	}
}

extension FeedInteractor: FeedInteractorInput {
    func loadArticles() {
		self.articlesNetworkService.requestArticles { result in
			switch result {
			case .success(let response):
				self.output?.didLoad(response.articles)
			case .failure(let error):
				self.output?.didEncounterError(error)
			}
		}
	}
}
