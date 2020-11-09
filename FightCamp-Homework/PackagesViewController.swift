//
//  PackagesViewController.swift
//  FightCamp-Homework
//
//  Created by Jenny Luu on 11/8/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

class PackagesViewController: UIViewController {

    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var firstPackageView = PackageView()
    private var secondPackageView = PackageView()
    private var thirdPackageView = PackageView()

    private var packageViewModel = PackageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        packageViewModel.fetchPackages()

        // Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(firstPackageView)
        contentView.addSubview(secondPackageView)
        contentView.addSubview(thirdPackageView)

        // Set constraints
        setScrollViewConstraints()
        setScrollContentViewConstraints()
        setFirstPackageViewConstraints()
        setSecondPackageViewConstraints()
        setThirdPackageViewConstraints()

        // Configure views
        configureScrollView()
        configureFirstPackageView()
        configureSecondPackageView()
        configureThirdPackageView()
    }

    // MARK: - Configure scroll view and package views

    private func configureScrollView() {
        scrollView.backgroundColor = .secondaryBackground
    }

    private func configureFirstPackageView() {
        firstPackageView.layer.cornerRadius = .packageRadius
        let firstPackage = packageViewModel.packagesArray[0]
        let firstPackageImages = firstPackage.thumbnail_urls
        setThumbnailImages(package: firstPackageView, packageImages: firstPackageImages)
        firstPackageView.configurePackage(with: firstPackage)
    }

    private func configureSecondPackageView() {
        secondPackageView.layer.cornerRadius = .packageRadius
        let secondPackage = packageViewModel.packagesArray[1]
        let secondPackageImages = secondPackage.thumbnail_urls
        setThumbnailImages(package: secondPackageView, packageImages: secondPackageImages)
        secondPackageView.configurePackage(with: secondPackage)
    }

    private func configureThirdPackageView() {
        thirdPackageView.layer.cornerRadius = .packageRadius
        let thirdPackage = packageViewModel.packagesArray[2]
        let thirdPackageImages = thirdPackage.thumbnail_urls
        setThumbnailImages(package: thirdPackageView, packageImages: thirdPackageImages)
        thirdPackageView.configurePackage(with: thirdPackage)
    }

    // MARK: - Set thumbnail images for each package

    private func setThumbnailImages(package: PackageView, packageImages: [String]) {
        package.mainThumbnailImageView.setImage(with: packageImages[0])
        package.firstItemButton.setButtonImage(with: packageImages[0])
        package.secondItemButton.setButtonImage(with: packageImages[1])
        package.thirdItemButton.setButtonImage(with: packageImages[2])
        package.fourthItemButton.setButtonImage(with: packageImages[3])
    }

    // MARK: - Set constraints for the scroll view and package views

    private func setScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }

    private func setScrollContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    }

    private func setFirstPackageViewConstraints() {
        firstPackageView.translatesAutoresizingMaskIntoConstraints = false
        firstPackageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18).isActive = true
        firstPackageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .packageSpacing).isActive = true
        firstPackageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        firstPackageView.heightAnchor.constraint(equalToConstant: view.frame.height + 140).isActive = true
        firstPackageView.widthAnchor.constraint(equalToConstant: view.frame.width - 8).isActive = true
    }

    private func setSecondPackageViewConstraints() {
        secondPackageView.translatesAutoresizingMaskIntoConstraints = false
        secondPackageView.topAnchor.constraint(equalTo: firstPackageView.bottomAnchor, constant: .packageSpacing).isActive = true
        secondPackageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .packageSpacing).isActive = true
        secondPackageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        secondPackageView.heightAnchor.constraint(equalToConstant: view.frame.height + 140).isActive = true
        secondPackageView.widthAnchor.constraint(equalToConstant: view.frame.width - 8).isActive = true
    }

    private func setThirdPackageViewConstraints() {
        thirdPackageView.translatesAutoresizingMaskIntoConstraints = false
        thirdPackageView.topAnchor.constraint(equalTo: secondPackageView.bottomAnchor, constant: .packageSpacing).isActive = true
        thirdPackageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .packageSpacing).isActive = true
        thirdPackageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .packageSpacing).isActive = true
        thirdPackageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        thirdPackageView.heightAnchor.constraint(equalToConstant: view.frame.height + 140).isActive = true
        thirdPackageView.widthAnchor.constraint(equalToConstant: view.frame.width - 8).isActive = true
    }
}
