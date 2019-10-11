//
//  GameFieldTarget.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/10/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

@IBDesignable
class GameFieldTargetView: BaseView {

    override func draw(_ rect: CGRect) {
        drawGameField(rect: rect)
    }
}
