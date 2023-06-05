//
//  StateItemView.swift
//  WorkoutApp
//
//  Created by user on 05.06.2023.
//

import UIKit


final class StatsItemView: BaseView {
    struct StatsItem {
        let image: UIImage?
        let value: String
        let title: String
    }

    private let imageView = UIImageView()

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 17)
        label.textColor = Resources.Colors.titleGray
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 10)
        label.textColor = Resources.Colors.inactive
        return label
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()

    func configure(with item: StatsItem) {
        imageView.image = item.image
        valueLabel.text = item.value
        titleLabel.text = item.title.uppercased()
    }
}

extension StatsItemView {
    override func setupViews() {
        super.setupViews()

        setupView(imageView)
        setupView(stackView)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }

    override func setupConstraintViews() {
        super.setupConstraintViews()

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),

            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
    }
}
