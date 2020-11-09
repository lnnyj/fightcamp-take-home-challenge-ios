//
//  PackageViewModel.swift
//  FightCamp-Homework
//
//  Created by Jenny Luu on 11/8/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation

class PackageViewModel {

    var packagesArray = [Package]()

    func fetchPackages() {
        guard let path = Bundle.main.path(forResource: "packages", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            let jsonData = try Data(contentsOf: url)
            let package = try JSONDecoder().decode([Package].self, from: jsonData)
            packagesArray = package
        }
        catch {
            print(error)
        }
    }

}
