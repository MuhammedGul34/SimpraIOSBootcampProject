//
//  LocalizableExtension.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 22.01.2023.
//

import Foundation


extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
