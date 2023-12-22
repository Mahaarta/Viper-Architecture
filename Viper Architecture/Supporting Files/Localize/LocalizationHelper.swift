//
//  Localization.swift
//  Viper Architecture
//
//  Created by Minata on 20/12/2023.
//

import Foundation

func localizedString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

func localizedString(_ key: String, tableName: String? = nil, bundle: Bundle = .main, value: String = "", comment: String) -> String {
    return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: value, comment: comment)
}
