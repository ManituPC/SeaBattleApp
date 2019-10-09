//
//  GameField.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/8/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation
import UIKit


class GameField {
    let size = (height: 10, wigth: 10)
    var boadsList = [Boad]()
    var fieldsList = [Field]()
    
    struct Point {
        let x: CGFloat
        let y: CGFloat
    }
    
    struct Field {
//        let isFieldEmpty: Bool
        var blockId: Int
        var coordinateBegin: (x: CGFloat, y: CGFloat)
        var wigth: CGFloat = 30
//        let padding: CGFloat
    }
}


class Boad {
    var size = 0
    let isVertical = true
    let coordinate = Set<Int>()
    var isAlive = true
}
