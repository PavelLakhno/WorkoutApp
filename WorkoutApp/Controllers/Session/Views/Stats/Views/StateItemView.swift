//
//  StateItemView.swift
//  WorkoutApp
//
//  Created by user on 05.06.2023.
//

import UIKit

enum StatsItem {
    case averagePace(value: String)
    case heartRate(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case .averagePace(let value):
            return .init(image: Resources.Images.Session.Stats.averagePace,
                         value: value + "/ km",
                         title: Resources.Strings.Session.averagePace)
        case .heartRate(let value):
            return .init(image: Resources.Images.Session.Stats.heartRate,
                         value: value + " bpm",
                         title: Resources.Strings.Session.heartRate)
        case .totalDistance(let value):
            return .init(image: Resources.Images.Session.Stats.totalDistance,
                         value: value + " km",
                         title: Resources.Strings.Session.totalDistance)
        case .totalSteps(let value):
            return .init(image: Resources.Images.Session.Stats.totalSteps,
                         value: value,
                         title: Resources.Strings.Session.totalSteps)
        }
    }
}


final class StatsItemView: BaseView {
    struct ItemData {
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
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title.uppercased()
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
