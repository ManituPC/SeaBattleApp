//
//  IntroductionView.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

@IBDesignable
class GameFieldSelfView: BaseView {
    
    override func draw(_ rect: CGRect) {
        drawGameField(rect: rect)
    }
}
