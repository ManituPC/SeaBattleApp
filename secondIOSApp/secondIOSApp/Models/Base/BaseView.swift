//
//  BaseView.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/10/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit


class BaseView: UIView {
    
    let gameController = GameController()
    let gameField = GameField()
    var squareID = 0
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch = UITouch()
        if let currentTouch = touches.first {
            touch = currentTouch
        }
        let position = touch.location(in: self)
        
        getSquare(position: position)
    }
    

    // draw Game filed
    func drawGameField(rect: CGRect) {
        let outPadding: CGFloat = 10
        let squareWigth: CGFloat = (rect.height - outPadding * 2) / CGFloat(gameField.size.height)
        let x: CGFloat = rect.origin.x + (rect.width - squareWigth * CGFloat(gameField.size.wigth)) / 2
        let y: CGFloat = rect.origin.y + outPadding
                
        var color = UIColor.darkGray
        var index = 0

        var row = gameField.size.height
        var column = gameField.size.wigth
        var square = GameField.Field(blockId: 1, coordinateBegin: (x, y))
        square.wigth = squareWigth
                
        while row > 0 {
            if gameField.fieldsList.count < gameField.size.height * gameField.size.wigth {
                gameField.fieldsList.append(square)
            } else {
                square = gameField.fieldsList[index]
            }
            
            let pathRect = CGRect(x: square.coordinateBegin.x, y: square.coordinateBegin.y, width: squareWigth, height: squareWigth)
            let path = UIBezierPath(rect: pathRect)
            
            if square.isFieldTap {
                color = .red
                gameField.fieldsList[squareID - 1].color = color
                color.setFill()
                path.fill()
            } else {
                color = .darkGray
                path.lineWidth = 1
                color.setStroke()
                path.stroke()
            }

            square.coordinateBegin.x += squareWigth
            if square.blockId < gameField.size.height * gameField.size.wigth {
                square.blockId += 1
            }
            column -= 1
            
            if index < gameField.size.height * gameField.size.wigth - 1 {
                index += 1
            }
            
            if column == 0 {
                square.coordinateBegin.x = rect.origin.x + (rect.width - squareWigth * 10) / 2
                square.coordinateBegin.y += squareWigth
                row -= 1
                column = gameField.size.wigth
            }
        }
        
        index = 0
        
        drawBoat(rect: rect)
    }
    
    func drawBoat(rect: CGRect) {
        if gameField.boadsList.count > 0 {
            for boat in gameField.boadsList {
                let color = UIColor.random()
                let bool = Bool.random()
                let x = (gameField.fieldsList.last?.coordinateBegin.x) ?? 0.0
                let y = (gameField.fieldsList.last?.coordinateBegin.y) ?? 0.0
                var number = gameController.getRandomSquare(gameField: gameField)
                //var index = 1
                let boatWigth = gameField.fieldsList[number].wigth
                let boatHeight = gameField.fieldsList[number].wigth * CGFloat(boat.size)
                boat.isVertical = bool
                boat.coordinate = gameField.fieldsList[number].coordinateBegin
                
                var pathRect = CGRect()
                
                    switch boat.isVertical {
                    case true:
                        loopY:
                        if (boat.coordinate.y + boatHeight) > y {
                            let raznica = (boat.coordinate.y + boatHeight) - (y + boatWigth)
                            boat.coordinate.y -= raznica
                        }
                        // TODO: add checkin isEmpty for gameField.field
                        
                        pathRect = CGRect(x: boat.coordinate.x, y: boat.coordinate.y, width: boatWigth, height: boatHeight)
                    case false:
                        if (boat.coordinate.x + boatHeight) > x {
                            let raznica = (boat.coordinate.x + boatHeight) - (x + boatWigth)
                            boat.coordinate.x -= raznica
                        }
                        pathRect = CGRect(x: boat.coordinate.x, y: boat.coordinate.y, width: boatHeight, height: boatWigth)
                    }
                
                let path = UIBezierPath(rect: pathRect)
                color.setFill()
                path.fill()
                gameField.fieldsList[number].isEmpty = false
                    //index += 1
                //}
            }
        }
    }
    
    func getSquare(position: CGPoint) {
        for i in 0...gameField.fieldsList.count - 1 {
            let square = gameField.fieldsList[i]
            if position.x > square.coordinateBegin.x && position.x < square.coordinateBegin.x + square.wigth {
                if position.y > square.coordinateBegin.y && position.y < square.coordinateBegin.y + square.wigth {
                    squareID = square.blockId
                    print("[DEBUG] isTap for squareID \(squareID)")
                    gameField.fieldsList = gameField.fieldsList.map {
                        var v = $0
                        if $0.blockId == squareID {
                            v.isFieldTap = !v.isFieldTap
                        }
                        return v
                    }
                    break
                }
            }
        }
        updateDrawing()
    }
    
    func updateDrawing() {
        self.setNeedsDisplay()
    }
    
    
    // ======= is for example =======
    
    private func drawManyRectangle(rect: CGRect) {
        // Many rectangle
        let patternPadding: CGFloat = 20
        var x: CGFloat = patternPadding
        var y: CGFloat = patternPadding
         
        let color = UIColor.darkGray

        while y <= rect.height - 20 {
            let pathRect = CGRect(x: x, y: y, width: patternPadding, height: patternPadding)
            let path = UIBezierPath(rect: pathRect)
            path.lineWidth = 2
            color.setStroke()
            path.stroke()
             
            x += patternPadding
             
            if x > rect.width - 20 {
                x = patternPadding
                y += patternPadding
            }
        }
    }
    
    private func drawStar(rect: CGRect) {
        // One star
        let padding: CGFloat = 40
        let pathRect = CGRect(x: padding, y: padding, width: rect.width - padding * 2, height: rect.width - padding * 2)
        let path = self.startIn(rect: pathRect)
        UIColor.black.setFill()
        path.fill()
                
        // Many stars
        let patternPadding: CGFloat = 20
        let patternRadius: CGFloat = 20
        
        var x: CGFloat = patternPadding
        var y: CGFloat = patternPadding
        
        while y <= rect.height {
            let pathRect = CGRect(x: x, y: y, width: patternRadius, height: patternRadius)
        
            let path = self.startIn(rect: pathRect)
            UIColor.black.setFill()
            path.fill()
        
            x += patternRadius + patternPadding
        
            if x > rect.width {
                x = patternPadding
                y += patternRadius + patternPadding
            }
        }
    }
    
    private func startIn(rect: CGRect) -> UIBezierPath {
        let center = CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
        
        let pointsOnStar = 4
        
        var angle: CGFloat = CGFloat(CGFloat.pi / 2)
        let angleIncrement = CGFloat(Double.pi * 2.0 / Double(pointsOnStar))
        let radius: CGFloat = rect.width / 2
        let midRadius: CGFloat = 0.25 * radius
        
        var firstPoint = true
        
        let path = UIBezierPath()
        
        for _ in 1...pointsOnStar {
           let point = pointFrom(angle: angle, radius: midRadius, offset: center)
           let nextPoint = pointFrom(angle: angle + angleIncrement, radius: midRadius, offset: center)
           let midPoint = pointFrom(angle: angle + angleIncrement / 2.0, radius: radius, offset: center)
                    
           if firstPoint {
              firstPoint = false
              path.move(to: point)
           }
           path.addLine(to: midPoint)
           path.addLine(to: nextPoint)
           
           angle += angleIncrement
        }
        path.close()
        
        return path
    }
    
    private func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        let x = radius * cos(angle) + offset.x
        let y = radius * sin(angle) + offset.y
             
        return CGPoint(x: x, y: y)
    }
    
    private func drawCicular(in rect: CGRect) {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2 - 100
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 3 * CGFloat.pi / 2, clockwise: false)
        path.lineWidth = 4
        
        let color = UIColor.red
        color.setStroke()
        path.stroke()
    }
    
    private func drawLines(in rect: CGRect) {
        let path = UIBezierPath()
    
        let point1 = CGPoint(x: 0, y: rect.origin.y + rect.height / 2)
        let point2 = CGPoint(x: rect.width / 2, y: rect.origin.y)
        let point3 = CGPoint(x: rect.width, y: rect.origin.y + rect.height / 2)
        
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)

        path.lineWidth = 4
        
        let color = UIColor.blue
        color.setStroke()
        path.stroke()
    }
    
    private func drawManyRectangle(in rect: CGRect) {
        let pathRect3 = CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 2)
        let path3 = UIBezierPath(roundedRect: pathRect3, cornerRadius: 0)
        path3.addClip()
        
        let pathRect1 = CGRect(x: 50, y: 50, width: rect.width - 100, height: rect.height - 100)
        let path1 = UIBezierPath(roundedRect: pathRect1, cornerRadius: 24)
        let color1 = UIColor.green
        color1.setFill()
        path1.fill()
        
        let pathRect2 = CGRect(x: 100, y: 100, width: rect.width - 200, height: rect.height - 200)
        let path2 = UIBezierPath(roundedRect: pathRect2, cornerRadius: 24)
        let color2 = UIColor.blue
        color2.setFill()
        path2.fill()
    }
    
    private func drawRectangle(in rect: CGRect) {
        // One rectangle
        let pathRect1 = CGRect(x: 50, y: 50, width: rect.width - 100, height: rect.height - 100)
        let path1 = UIBezierPath(rect: pathRect1)
        let color1 = UIColor.green
        path1.lineWidth = 2
        color1.setStroke()
        path1.stroke()
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
