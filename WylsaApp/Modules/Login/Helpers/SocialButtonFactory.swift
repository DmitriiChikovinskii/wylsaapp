//
// Created by Dmitrii Space on 09.03.2020.
// Copyright (c) 2020 Dmitrii Space. All rights reserved.
//

import UIKit
import AuthenticationServices

final class SocialButtonFactory {
    static func makeApple() -> UIControl? {
        if #available(iOS 13.0, *) {
            return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
        }
        else {
            return nil
        }
    }
}
