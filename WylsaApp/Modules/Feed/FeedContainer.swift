//
//  FeedContainer.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 2019-06-30.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import UIKit

final class FeedContainer {
    let input: FeedModuleInput
	let viewController: UIViewController
	private(set) weak var router: FeedRouterInput!

	class func assemble(with context: FeedContext) -> FeedContainer {
        let router = FeedRouter()
        let interactor = FeedInteractor(articlesNetworkService: context.moduleDependencies.articlesNetworkService)
        let presenter = FeedPresenter(router: router, interactor: interactor)
		let viewController = FeedViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return FeedContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: FeedModuleInput, router: FeedRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct FeedContext {
	typealias ModuleDependencies = HasArticlesNetworkService

	let moduleDependencies: ModuleDependencies
	weak var moduleOutput: FeedModuleOutput?
}
