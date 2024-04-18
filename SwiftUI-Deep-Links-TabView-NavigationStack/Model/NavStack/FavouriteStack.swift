//
//  FavourtieStack.swift
//  SwiftUI-Deep-Links-TabView-NavigationStack
//
//  Created by YILMAZ ER on 18.04.2024.
//

import Foundation

enum FavouriteStack: String, CaseIterable {
    case iJustine = "iJustine"
    case kaviya = "Kaviya"
    case jenna = "Jenna"
    
    static func convert(from: String) -> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
