//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Pavel Lakhno on 30.07.2024.
//

import UIKit

final class XAxisView: BaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        data.forEach {
            let label = UILabel()
            label.font = Resources.Fonts.helvelticaRegular(with: 9)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .center
            label.text = $0.title.uppercased()
            
            stackView.addArrangedSubview(label)
        }
    }
       
}

extension XAxisView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func setupConstraintViews() {
        super.setupConstraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

