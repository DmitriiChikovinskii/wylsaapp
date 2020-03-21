//
//  LoginProtocols.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 09.03.2020.
//    Copyright © 2020 Dmitrii Space. All rights reserved.
//

import Foundation

protocol LoginModuleInput {
	var moduleOutput: LoginModuleOutput? { get }
}

protocol LoginModuleOutput: class {
	func loginModuleDidFinish()
}

protocol LoginViewInput: class {
}

protocol LoginViewOutput: class {
	func onCloseTap()
    func onAuthTap()
}

protocol LoginInteractorInput: class {
	func authenticate()
}

protocol LoginInteractorOutput: class {
	func authenticationCompleted()
}

protocol LoginRouterInput: class {
}
