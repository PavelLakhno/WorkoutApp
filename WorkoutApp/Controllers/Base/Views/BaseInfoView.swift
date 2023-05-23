//
//  BaseInfoView.swift
//  WorkoutApp
//
//  Created by user on 23.05.2023.
//

import UIKit

class BaseInfoView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        return label
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resources.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()

    init(with title: String? = nil, alignment: NSTextAlignment = .left) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = alignment

        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }

}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()

        setupView(titleLabel)
        setupView(contentView)
    }

    override func setupConstraintViews() {
        super.setupConstraintViews()

        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentTopOffset: CGFloat = titleLabel.text == nil ? 0 : 10

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
    }
}
