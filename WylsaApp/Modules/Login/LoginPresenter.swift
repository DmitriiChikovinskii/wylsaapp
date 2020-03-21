//
//  LoginPresenter.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 09.03.2020.
//    Copyright © 2020 Dmitrii Space. All rights reserved.
//

import Foundation

final class LoginPresenter {
	weak var view: LoginViewInput?
    weak var moduleOutput: LoginModuleOutput?
    
	private let router: LoginRouterInput
	private let interactor: LoginInteractorInput
    
    init(router: LoginRouterInput, interactor: LoginInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension LoginPresenter: LoginModuleInput {
}

extension LoginPresenter: LoginViewOutput {
    func onCloseTap() {
        self.moduleOutput?.loginModuleDidFinish()
    }

    func onAuthTap() {
        self.interactor.authenticate()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    func authenticationCompleted() {

    }
}
