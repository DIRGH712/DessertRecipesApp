//
//  MealDetail.swift
//  DessertRecipesApp
//
//  Created by Dirgh Patel on 3/18/24.
//

import Foundation

struct MealDetail: Codable {
    let meals: [Detail]
}

struct Detail: Codable, Identifiable {
    var id: String { idMeal }
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: URL?
    var ingredients: [String] {
        var result = [String]()
        for i in 1...20 {
            if let value = self.value(forKey: "strIngredient\(i)") as? String, !value.isEmpty {
                result.append(value)
            }
        }
        return result
    }
    var measurements: [String] {
        var result = [String]()
        for i in 1...20 {
            if let value = self.value(forKey: "strMeasure\(i)") as? String, !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                result.append(value)
            }
        }
        return result
    }

    private func value(forKey key: String) -> Any? {
        let mirror = Mirror(reflecting: self)
        return mirror.children.first(where: { $0.label == key })?.value
    }
}


