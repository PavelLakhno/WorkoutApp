//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by user on 25.05.2023.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        func drawProgress(with precent: CGFloat) {
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6

            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)

            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            shapeLayer.strokeColor = Resources.Colors.active.cgColor
            shapeLayer.lineWidth = 20
            shapeLayer.strokeEnd = precent
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineCap = .round
            
            layer.addSublayer(shapeLayer)
        }
    }
}

