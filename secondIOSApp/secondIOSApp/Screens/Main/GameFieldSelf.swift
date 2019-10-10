//
//  IntroductionView.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

@IBDesignable
class GameFieldSelf: BaseView {
    
    override func draw(_ rect: CGRect) {
        let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 2)
        drawGameField(rect: rect)
    }
}
