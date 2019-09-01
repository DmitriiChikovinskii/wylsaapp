//
//  FeedPresenter.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 2019-06-30.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import Foundation

final class FeedPresenter {
    weak var view: FeedViewInput?
    weak var moduleOutput: FeedModuleOutput?

    private let router: FeedRouterInput
    private let interactor: FeedInteractorInput

    private var isNextPageLoading = false
    private var isReloading = false
    private var hasNextPage = true
    private var articles: [Article] = []

    init(router: FeedRouterInput, interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FeedPresenter: FeedModuleInput {
}

extension FeedPresenter: FeedViewOutput {
    func viewDidLoad() {
        self.isReloading = true
        self.interactor.reload()
    }

    func willDisplay(at index: Int) {
        guard !self.isReloading,
              !self.isNextPageLoading,
              (self.articles.count - index) < 10 else {
            return
        }
        self.isNextPageLoading = true
        self.interactor.loadNext()
    }
}

extension FeedPresenter: FeedInteractorOutput {
    func didEncounterError(_ error: Error) {
        // TODO: implement error handling
    }

    func didLoad(_ articles: [Article], loadType: LoadingDataType) {
        switch loadType {
        case .reload:
            self.isReloading = false
            self.articles = articles
        case .nextPage:
            self.isNextPageLoading = false
            self.hasNextPage = articles.count > 0
            self.articles.append(contentsOf: articles)
        }
        let viewModels: [FeedCardViewModel] = self.makeViewModels(self.articles)
        self.view?.set(viewModels: viewModels)
    }
}

private extension FeedPresenter {
    func makeViewModels(_ articles: [Article]) -> [FeedCardViewModel] {
        return articles.map { article in
            FeedCardViewModel(info: "info",
                              title: article.title ?? "",
                              shortDescription: article.description ?? "",
                              imageName: article.urlToImage ?? "")
        }
    }
}