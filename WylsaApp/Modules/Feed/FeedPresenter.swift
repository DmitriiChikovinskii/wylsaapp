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

    init(router: FeedRouterInput, interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FeedPresenter: FeedModuleInput {
}

extension FeedPresenter: FeedViewOutput {
    func viewDidLoad() {
        self.view?.set(viewModels: self.makeViewModels())
    }
}

extension FeedPresenter: FeedInteractorOutput {
}

private extension FeedPresenter {
    func makeViewModels() -> [FeedCardViewModel] {
        return [
            FeedCardViewModel(info: "Новости",
                              title: "Google запустит аналог AirDrop",
                              shortDescription: "Функция Fast Share должна стать аналогом AirDrop, но для устройств Google. Для передачи данных используется Wi-Fi и Bluetooth. Можно будет ",
                              imageName: "feed1"),
            FeedCardViewModel(info: "Прикольная новость",
                              title: "Кликбейт заголовок про то какой же крутой это смартфон от китайцев",
                              shortDescription: "Каждый раз одно и то же, так что читайте!!!",
                              imageName: "feed2"),
            FeedCardViewModel(info: "Статья",
                              title: "Лучшее за неделю: будущие Apple Watch и iPhone 11",
                              shortDescription: "Short text",
                              imageName: "feed3"),
            FeedCardViewModel(info: "Новости",
                              title: "Google запустит аналог AirDrop",
                              shortDescription: "Функция Fast Share должна стать аналогом AirDrop, но для устройств Google. Для передачи данных используется Wi-Fi и Bluetooth. Можно будет ",
                              imageName: "feed1"),
            FeedCardViewModel(info: "Прикольная новость",
                              title: "Кликбейт заголовок про то какой же крутой это смартфон от китайцев",
                              shortDescription: "Каждый раз одно и то же, так что читайте!!!",
                              imageName: "feed2"),
            FeedCardViewModel(info: "Статья",
                              title: "Лучшее за неделю: будущие Apple Watch и iPhone 11",
                              shortDescription: "Short text",
                              imageName: "feed3"),
            FeedCardViewModel(info: "Новости",
                              title: "Google запустит аналог AirDrop",
                              shortDescription: "Функция Fast Share должна стать аналогом AirDrop, но для устройств Google. Для передачи данных используется Wi-Fi и Bluetooth. Можно будет ",
                              imageName: "feed1"),
            FeedCardViewModel(info: "Прикольная новость",
                              title: "Кликбейт заголовок про то какой же крутой это смартфон от китайцев",
                              shortDescription: "Каждый раз одно и то же, так что читайте!!!",
                              imageName: "feed2"),
            FeedCardViewModel(info: "Статья",
                              title: "Лучшее за неделю: будущие Apple Watch и iPhone 11",
                              shortDescription: "Short text",
                              imageName: "feed3")]
    }
}