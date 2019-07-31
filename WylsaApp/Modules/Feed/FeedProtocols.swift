//
//  FeedProtocols.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 2019-06-30.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import Foundation

protocol FeedModuleInput {
	var moduleOutput: FeedModuleOutput? { get }
}

protocol FeedModuleOutput: class {
}

protocol FeedViewInput: class {
    func set(viewModels: [FeedCardViewModel])
}

protocol FeedViewOutput: class {
    func viewDidLoad()
}

protocol FeedInteractorInput: class {
    func loadArticles()
}

protocol FeedInteractorOutput: class {
    func didEncounterError(_ error: Error)
    func didLoad(_ articles: [Article])
}

protocol FeedRouterInput: class {
}
