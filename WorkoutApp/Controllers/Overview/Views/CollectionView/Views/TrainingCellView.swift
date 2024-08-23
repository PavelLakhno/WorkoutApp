//
//  TrainingCellView.swift
//  WorkoutApp
//
//  Created by Pavel Lakhno on 23.08.2024.
//

import UIKit

final class TrainingCellView: UICollectionReusableView {
    static let id = "TrainingCellView"
    
    private let checkmarkView: UIImageView = {
        let view = UIImageView()
        view.image = Resources.Images.Overview.checkmarkNotDone
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 17)
        label.textAlignment = .left
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textAlignment = .left
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    private let rightArrowView = UIImageView(image: Resources.Images.Overview.rightArrow)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraintViews()
        configureAppearance()

    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraintViews()
        configureAppearance()
    }
    
    func configure(with title: String, subTitle: String, isDone: Bool) {
        self.title.text = title
        self.subTitle.text = subTitle
        self.checkmarkView.image = isDone ? Resources.Images.Overview.checkmarkDone : Resources.Images.Overview.checkmarkNotDone
    }
}


extension TrainingCellView {
    
    func setupViews() {
        setupView(checkmarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subTitle)
        setupView(rightArrowView)
    }
    
    func setupConstraintViews() {
        
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: 15),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7),

        ])
    }
    
    func configureAppearance() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = Resources.Colors.separator.cgColor
    }

}
