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

	private var page: Int = Constants.initialPage

	init(articlesNetworkService: ArticlesNetworkProtocol) {
		self.articlesNetworkService = articlesNetworkService
	}
}

extension FeedInteractor: FeedInteractorInput {
	func reload() {
		self.page = Constants.initialPage
		self.load()
	}

	func loadNext() {
		self.load()
	}
}

private extension FeedInteractor {
	func load() {
		let params = ArticlesRequestParams(pageSize: 20, page: self.page, search: "world")
		self.articlesNetworkService.requestArticles(params: params) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let response):
				self.output?.didLoad(response.articles, loadType: self.page == Constants.initialPage ? .reload : .nextPage)
				self.page += 1
			case .failure(let error):
				self.output?.didEncounterError(error)
			}
		}
	}
}

private enum Constants {
	static let initialPage = 1
}