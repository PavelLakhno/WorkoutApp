//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Pavel Lakhno on 30.07.2024.
//


import UIKit

extension WAChartsView {
    struct Data {
        let value: Int
        let title: String
    }
}

final class WAChartsView: BaseView {
    
    private let xAxisView = XAxisView()
    private let yAxisView = YAxisView()
    private let chartView = ChartView()
    
    func configure(with data: [WAChartsView.Data]) {
        xAxisView.configure(with: data)
        yAxisView.configure(with: data)
        chartView.configure(with: data)
    }
}

extension WAChartsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)
        
    }
    
    override func setupConstraintViews() {
        super.setupConstraintViews()
        
        NSLayoutConstraint.activate([
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),

            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 8),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            chartView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

