//
// Created by Dmitrii Space on 2019-07-01.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import UIKit

class FeedViewCell<T: UIView>: UICollectionViewCell {

    let containerView: T

    override init(frame: CGRect) {
        self.containerView = T(frame: .zero)
        super.init(frame: frame)
        self.contentView.addSubview(self.containerView)
    }

    required override init?(coder aDecoder: NSCoder) {
        fatalError("unsupported")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
    }
}


