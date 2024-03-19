//
//  Meal.swift
//  DessertRecipesApp
//
//  Created by Dirgh Patel on 3/18/24.
//

import Foundation

struct MealList: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    var id: String { idMeal }
    let idMeal: String
    let strMeal: String
    let strMealThumb: URL // Assuming you want to use the image URL
}
