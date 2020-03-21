//
// Created by Dmitrii Space on 09.03.2020.
// Copyright (c) 2020 Dmitrii Space. All rights reserved.
//

import UIKit

class BlockBarButtonItem: UIBarButtonItem {

    private var handler: VoidClosure?
    
    static func item(title: String, style: UIBarButtonItem.Style, handler: @escaping VoidClosure) -> UIBarButtonItem {
        let result = BlockBarButtonItem(title: title, style: style, target: nil, action: nil)
        result.handler = handler
        result.action = #selector(onTap)
        return result
    }

    @objc
    private func onTap() {
        self.handler?()
    }
}
