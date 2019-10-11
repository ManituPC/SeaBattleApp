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
    
    
    func addBoats() -> [Boat] {
        var boatsList = [Boat]()
        
        var boat = Boat()
        boat.size = 1
        
        boatsList.append(boat)
        boatsList.append(boat)
        boatsList.append(boat)
        boatsList.append(boat)
        
        
        return boatsList
    }
}
