//
// Created by Dmitrii Space on 2019-07-01.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import UIKit

enum Font {
    enum Weight {
        case regular, medium, bold
    }

    static func system(ofSize size: CGFloat, weight: Weight) -> UIFont {
        switch weight {
        case .regular:
            return UIFont.systemFont(ofSize: size, weight: .regular)
        case .medium:
            return UIFont.systemFont(ofSize: size, weight: .medium)
        case .bold:
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}
