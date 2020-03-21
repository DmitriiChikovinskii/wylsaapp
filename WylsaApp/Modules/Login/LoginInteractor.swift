//
//  LoginInteractor.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 09.03.2020.
//    Copyright © 2020 Dmitrii Space. All rights reserved.
//

import Foundation

final class LoginInteractor {
	weak var output: LoginInteractorOutput?

	private var loginService: LoginService?
}

extension LoginInteractor: LoginInteractorInput {
	func authenticate() {
		self.loginService = LoginServiceFactory.makeApple()
		self.loginService?.login(completion: { result in
			switch result {
			case .success(let authResult):
				self.output?.authenticationCompleted()
			case .failure(let error):
				assertionFailure("need to handle")
			}
		})
	}
}
