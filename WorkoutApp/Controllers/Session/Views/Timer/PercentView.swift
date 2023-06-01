//
//  PercentView.swift
//  WorkoutApp
//
//  Created by user on 01.06.2023.
//

import UIKit

extension TimerView {
    final class PercentView: BaseView {
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helvelticaRegular(with: 23)
            label.textColor = Resources.Colors.titleGray
            label.textAlignment = .center
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helvelticaRegular(with: 10)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .center
            return label
        }()
        
        override func setupViews() {
            super.setupViews()
            
            setupView(stackView)
            stackView.addArrangedSubview(percentLabel)
            stackView.addArrangedSubview(subtitleLabel)
        }
        
        override func setupConstraintViews() {
            super.setupConstraintViews()
            
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        
        func configure(with title: String, andValue value: Int) {
            subtitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
    }
}
