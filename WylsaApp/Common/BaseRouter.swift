//
// Created by Dmitrii Space on 09.03.2020.
// Copyright (c) 2020 Dmitrii Space. All rights reserved.
//

import UIKit

class BaseRouter {
    var navigationControllerProvider: (() -> UINavigationController?)?

    var navigationController: UINavigationController? {
        self.navigationControllerProvider?()
    }

}
