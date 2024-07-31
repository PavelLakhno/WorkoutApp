//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Pavel Lakhno on 31.07.2024.
//

import UIKit

final class ChartView: BaseView {
    
    private let xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
    
    private let yAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()

    func configure(with data: [WAChartsView.Data]) {
        
        layoutIfNeeded()
        addDashesLines()
    }
       
}

extension ChartView {
    override func setupViews() {
        super.setupViews()
        
        setupView(xAxisSeparator)
        setupView(yAxisSeparator)
    }
    
    override func setupConstraintViews() {
        super.setupConstraintViews()
        
        NSLayoutConstraint.activate([
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1),
            
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

private extension ChartView {
    func addDashesLines(with count: Int? = nil) {
        
        (0..<9).map { CGFloat($0) }.forEach {
            addDashLine(at: $0 * bounds.height / 9)
        }
    }
    
    func addDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resources.Colors.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6,3]
        
        layer.addSublayer(dashLayer)
    }
}
