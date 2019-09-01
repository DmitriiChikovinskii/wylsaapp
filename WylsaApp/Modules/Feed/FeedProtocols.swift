//
//  FeedProtocols.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 2019-06-30.
//    Copyright © 2019 Dmitrii Space. All rights reserved.
//

import Foundation

enum LoadingDataType {
    case nextPage
    case reload
}

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
    func willDisplay(at index: Int)
}

protocol FeedInteractorInput: class {
    func reload()
    func loadNext()
}

protocol FeedInteractorOutput: class {
    func didEncounterError(_ error: Error)
    func didLoad(_ articles: [Article], loadType: LoadingDataType)
}

protocol FeedRouterInput: class {
}
