//
// Created by Dmitrii Space on 2019-07-01.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
