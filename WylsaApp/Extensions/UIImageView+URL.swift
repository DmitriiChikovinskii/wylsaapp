//
// Created by Dmitrii Space on 2019-07-28.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL?) {
        self.kf.setImage(with: url)
    }
}
