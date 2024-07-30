//
//  WABarView.swift
//  WorkoutApp
//
//  Created by user on 08.06.2023.
//

import UIKit

extension WABarView {
    struct Data {
        let value: String
        let heightMultiplier: Double
        let title: String
    }
}

final class WABarView: BaseView {
    
    private let heightMultiplier: Double
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 9)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.active
        view.layer.cornerRadius = 2.5
        return view 
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    init(data: Data) {
        self.heightMultiplier = data.heightMultiplier
        super.init(frame: .zero)
        
        titleLabel.text = data.title.uppercased()
        valueLabel.text = data.value
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }
    

    
}

extension WABarView {
    override func setupViews() {
        super.setupViews()
        
        setupView(valueLabel)
        setupView(barView)
        setupView(titleLabel)
    }
    
    override func setupConstraintViews() {
        super.setupConstraintViews()
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),

            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 7),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier * 0.8),

            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}
