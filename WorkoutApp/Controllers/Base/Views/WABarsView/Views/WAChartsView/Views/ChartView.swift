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

    func configure(with data: [WAChartsView.Data], topChartOffSet: Int) {
        
        layoutIfNeeded()
        drawDashesLines()
        drawChart(with: data, topChartOffSet: topChartOffSet)
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
    func drawDashesLines(with count: Int = 9) {
        
        (0..<count).map { CGFloat($0) }.forEach {
            drawDashLine(at: $0 * bounds.height / CGFloat(count))
        }
    }
    
    func drawDashLine(at yPosition: CGFloat) {
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
    
    func drawChart(with data: [WAChartsView.Data], topChartOffSet: Int = 10) {
        guard let maxValue = data.sorted(by: { $0.value > $1.value }).first?.value else { return }
        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y: CGFloat($1.value)) }
        let chartHeight = bounds.height / CGFloat(maxValue + topChartOffSet)
        
        let points = valuePoints.map {
            let x = bounds.width / CGFloat(valuePoints.count - 1) * $0.x
            let y = bounds.height - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])
        
        points.forEach {
            chartPath.addLine(to: $0)
            drawChartDot(with: $0)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = Resources.Colors.active.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1
        chartLayer.lineCap = .round
        chartLayer.lineJoin = .round
        
        layer.addSublayer(chartLayer)
        
    }
    
    func drawChartDot(with point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        dotLayer.strokeColor = Resources.Colors.active.cgColor
        
        layer.addSublayer(dotLayer)
    }
}
