//
// Created by Dmitrii Space on 2019-07-01.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import UIKit

class FeedCardView: UIView {

    private let infoLabel = UILabel()
    private let titleLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.addSubview(self.infoLabel)
        self.addSubview(self.titleLabel)
        self.addSubview(self.shortDescriptionLabel)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true

        self.titleLabel.numberOfLines = 3
        self.shortDescriptionLabel.numberOfLines = 2

        self.infoLabel.font = Font.system(ofSize: 14, weight: .medium)
        self.infoLabel.textColor = .white

        self.titleLabel.font = Font.system(ofSize: 24, weight: .bold)
        self.titleLabel.textColor = .white

        self.shortDescriptionLabel.font = Font.system(ofSize: 16, weight: .regular)
        self.shortDescriptionLabel.textColor = UIColor.rgba(158, 158, 158)

        self.imageView.contentMode = .scaleAspectFill
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("unsupported")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let maxLabelWidth = self.frame.width - Constants.margin * 2
        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)

        let infoLabelSize = self.infoLabel.sizeThatFits(maxLabelSize)
        self.infoLabel.frame.origin = CGPoint(x: Constants.margin, y: Constants.margin)
        self.infoLabel.frame.size = infoLabelSize

        let shortDescriptionSize = self.shortDescriptionLabel.sizeThatFits(maxLabelSize)
        let shortDescriptionOrigin = CGPoint(x: Constants.margin,
                                             y: self.frame.height - Constants.margin - shortDescriptionSize.height)
        self.shortDescriptionLabel.frame.origin = shortDescriptionOrigin
        self.shortDescriptionLabel.frame.size = shortDescriptionSize

        let titleLabelSize = self.titleLabel.sizeThatFits(maxLabelSize)
        let titleLabelOrigin = CGPoint(x: Constants.margin,
                                       y: self.shortDescriptionLabel.frame.minY - Constants.titleMarginBottom - titleLabelSize.height)
        self.titleLabel.frame.origin = titleLabelOrigin
        self.titleLabel.frame.size = titleLabelSize

        self.imageView.frame = self.frame
    }

    func update(with viewModel: FeedCardViewModel) {
        self.infoLabel.text = viewModel.info
        self.titleLabel.text = viewModel.title
        self.shortDescriptionLabel.text = viewModel.shortDescription
        self.imageView.setImage(with: URL(string: viewModel.imageName))
        self.setNeedsLayout()
    }
}

private struct Constants {
    static let margin: CGFloat = 24
    static let titleMarginBottom: CGFloat = 8
}
