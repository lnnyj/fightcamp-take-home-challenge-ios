//
//  PackageView.swift
//  FightCamp-Homework
//
//  Created by Jenny Luu on 11/8/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

class PackageView: UIView {

    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var thumbnailImageStackView = UIStackView()
    private var packageItemsLabel = UILabel()
    private var paymentDetailsLabel = UILabel()
    private var priceLabel = UILabel()
    private let actionButton = UIButton()

    var mainThumbnailImageView = UIImageView()
    var firstItemButton = UIButton()
    var secondItemButton = UIButton()
    var thirdItemButton = UIButton()
    var fourthItemButton = UIButton()

    private var currentThumbnail = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .primaryBackground

        // Add subviews
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(mainThumbnailImageView)
        addSubview(thumbnailImageStackView)
        addSubview(packageItemsLabel)
        addSubview(paymentDetailsLabel)
        addSubview(priceLabel)
        addSubview(actionButton)

        // Set default button border colors
        setDefaultButtonBorderColors()

        // Configure buttons
        configureButtons(with: firstItemButton)
        configureButtons(with: secondItemButton)
        configureButtons(with: thirdItemButton)
        configureButtons(with: fourthItemButton)

        // Set constraints
        setTitleLabelConstraints()
        setDescriptionLabelConstraints()
        setMainThumbnailImageViewConstraints()
        setThumbnailImageStackViewConstraints()
        setPackageItemsLabelConstraints()
        setPaymentDetailsLabelConstraints()
        setActionButtonConstraints()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configurePackage(with package: Package) {

        // Title
        titleLabel.text = package.title.uppercased()
        titleLabel.textColor = .brandRed
        titleLabel.font = .title
        titleLabel.adjustsFontSizeToFitWidth = true

        // Description
        descriptionLabel.text = package.desc.capitalized
        descriptionLabel.font = .body
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true

        // Main thumbnail
        mainThumbnailImageView.layer.cornerRadius = .thumbnailRadius
        mainThumbnailImageView.clipsToBounds = true
        mainThumbnailImageView.contentMode = .scaleAspectFill

        // Stack view for tappable items
        configureButtonStackView()

        // Included and excluded items
        packageItemsLabel.createLeftAlignedBodyText(includedItems: package.included, excludedItems: package.excluded)
        packageItemsLabel.numberOfLines = 0
        packageItemsLabel.sizeToFit()

        // Payment details
        paymentDetailsLabel.createCenteredMultilineText(paymentType: package.payment.capitalized, price: "\(package.price)")
        paymentDetailsLabel.numberOfLines = 0

        // View payment button
        actionButton.setTitle(package.action.capitalized, for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.titleLabel?.font = .button
        actionButton.titleLabel?.textAlignment = .center
        actionButton.backgroundColor = .brandRed
        actionButton.layer.cornerRadius = .buttonRadius
        actionButton.clipsToBounds = true
    }

    // MARK: - Button and stack view setup

    private func setDefaultButtonBorderColors() {
        currentThumbnail = firstItemButton
        currentThumbnail.layer.borderColor = UIColor.thumbnailBorder(selected: true).cgColor
        secondItemButton.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
        thirdItemButton.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
        fourthItemButton.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
    }

    private func configureButtons(with button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        button.layer.cornerRadius = .thumbnailRadius
        button.layer.masksToBounds = true
        button.layer.borderWidth = .thumbnailBorderWidth
        button.imageView?.contentMode = .scaleAspectFill
    }

    private func configureButtonStackView() {
        thumbnailImageStackView.axis = .horizontal
        thumbnailImageStackView.distribution = .fillEqually
        thumbnailImageStackView.alignment = .fill
        thumbnailImageStackView.spacing = .thumbnailSpacing
        thumbnailImageStackView.layoutIfNeeded()

        thumbnailImageStackView.addArrangedSubview(firstItemButton)
        thumbnailImageStackView.addArrangedSubview(secondItemButton)
        thumbnailImageStackView.addArrangedSubview(thirdItemButton)
        thumbnailImageStackView.addArrangedSubview(fourthItemButton)

        firstItemButton.addTarget(self, action: #selector(firstThumbnailTapped), for: .touchUpInside)
        secondItemButton.addTarget(self, action: #selector(secondThumbnailTapped), for: .touchUpInside)
        thirdItemButton.addTarget(self, action: #selector(thirdThumbnailTapped), for: .touchUpInside)
        fourthItemButton.addTarget(self, action: #selector(fourthThumbnailTapped), for: .touchUpInside)
    }

    // MARK: - Button actions

    @objc private func firstThumbnailTapped() {
        mainThumbnailImageView.image = firstItemButton.imageView?.image
        firstItemButton.layer.borderColor = UIColor.thumbnailBorder(selected: true).cgColor
        currentThumbnail.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
        currentThumbnail = firstItemButton
    }

    @objc private func secondThumbnailTapped() {
        mainThumbnailImageView.image = secondItemButton.imageView!.image
        secondItemButton.layer.borderColor = UIColor.thumbnailBorder(selected: true).cgColor
        currentThumbnail.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
        currentThumbnail = secondItemButton
    }

    @objc private func thirdThumbnailTapped() {
        mainThumbnailImageView.image = thirdItemButton.imageView?.image
        thirdItemButton.layer.borderColor = UIColor.thumbnailBorder(selected: true).cgColor
        currentThumbnail.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
        currentThumbnail = thirdItemButton
    }

    @objc private func fourthThumbnailTapped() {
        mainThumbnailImageView.image = fourthItemButton.imageView?.image
        fourthItemButton.layer.borderColor = UIColor.thumbnailBorder(selected: true).cgColor
        currentThumbnail.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
        currentThumbnail = fourthItemButton
    }

    // MARK: - Set constraints

    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .packageSpacing).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .packageSpacing).isActive = true
    }

    private func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .packageSpacing).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .packageSpacing).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
    }

    private func setMainThumbnailImageViewConstraints() {
        mainThumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        mainThumbnailImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .packageSpacing).isActive = true
        mainThumbnailImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .packageSpacing).isActive = true
        mainThumbnailImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        mainThumbnailImageView.heightAnchor.constraint(equalToConstant: .thumbnailHeight).isActive = true
    }

    private func setThumbnailImageStackViewConstraints() {
        thumbnailImageStackView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageStackView.topAnchor.constraint(equalTo: mainThumbnailImageView.bottomAnchor, constant: .thumbnailSpacing).isActive = true
        thumbnailImageStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .packageSpacing).isActive = true
        thumbnailImageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        thumbnailImageStackView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }

    private func setPackageItemsLabelConstraints() {
        packageItemsLabel.translatesAutoresizingMaskIntoConstraints = false
        packageItemsLabel.topAnchor.constraint(equalTo: thumbnailImageStackView.bottomAnchor, constant: .packageSpacing).isActive = true
        packageItemsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .packageSpacing).isActive = true
    }

    private func setPaymentDetailsLabelConstraints() {
        paymentDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        paymentDetailsLabel.topAnchor.constraint(equalTo: packageItemsLabel.bottomAnchor, constant: .packageSpacing).isActive = true
        paymentDetailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .packageSpacing).isActive = true
        paymentDetailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    }

    private func setActionButtonConstraints() {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.topAnchor.constraint(equalTo: paymentDetailsLabel.bottomAnchor, constant: .packageSpacing).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .packageSpacing).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: .buttonHeight).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }

}
