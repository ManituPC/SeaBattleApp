//
//  GameFieldTarget.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/10/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

@IBDesignable
class GameFieldTarget: BaseView {

    override func draw(_ rect: CGRect) {
        let rect = CGRect(x: 0, y: rect.height / 2, width: rect.width, height: rect.height / 2)
        drawGameField(rect: rect)
    }
}
