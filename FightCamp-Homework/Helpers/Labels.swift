//
//  Labels.swift
//  FightCamp-Homework
//
//  Created by Jenny Luu on 11/8/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

    func createLeftAlignedBodyText(includedItems: [String], excludedItems: [String]?) {
        let includedItemsText = includedItems.joined(separator: "\n").capitalized
        let includedItemsAttributedText = NSMutableAttributedString(string: includedItemsText)
        includedItemsAttributedText.addAttributes([NSAttributedString.Key.font: UIFont.body], range: NSRange(location: 0, length: includedItemsAttributedText.length))
        var excludedItemsAttributedText: NSMutableAttributedString?

        if let excludedItemsText = excludedItems?.joined(separator: "\n").capitalized {
            let workingAttributedText = NSMutableAttributedString(string: "\n\(excludedItemsText)")
            workingAttributedText.addAttributes([NSAttributedString.Key.font: UIFont.body], range: NSRange(location: 0, length: workingAttributedText.length))
            workingAttributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.disabledLabel, range: NSRange(location: 0, length: workingAttributedText.length))
            workingAttributedText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, workingAttributedText.length))
            excludedItemsAttributedText = workingAttributedText
        }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4

        includedItemsAttributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, includedItemsAttributedText.length))

        if let excludedItemsAttributedText = excludedItemsAttributedText {
            includedItemsAttributedText.append(excludedItemsAttributedText)
        }
        self.attributedText = includedItemsAttributedText
        self.textAlignment = .left
    }

    func createCenteredMultilineText(paymentType: String, price: String) {
        let paymentTypeAttributedText = NSMutableAttributedString(string: paymentType)
        let priceAttributedText = NSMutableAttributedString(string: "\n $\(price)")

        paymentTypeAttributedText.addAttributes([NSAttributedString.Key.font: UIFont.body], range: NSRange(location: 0, length: paymentTypeAttributedText.length))

        priceAttributedText.addAttributes([NSAttributedString.Key.font: UIFont.price], range: NSRange(location: 0, length: priceAttributedText.length))

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6

        paymentTypeAttributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, paymentTypeAttributedText.length))

        paymentTypeAttributedText.append(priceAttributedText)
        self.attributedText = paymentTypeAttributedText
        self.textAlignment = .center
    }
}
