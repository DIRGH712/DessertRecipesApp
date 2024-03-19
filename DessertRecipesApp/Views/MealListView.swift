//
//  MealListView.swift
//  DessertRecipesApp
//
//  Created by Dirgh Patel on 3/18/24.
//

import SwiftUI
import Combine


struct MealListView: View {
    @ObservedObject var viewModel = MealListViewModel()

    var body: some View {
        NavigationView {
            if viewModel.meals.isEmpty {
                Text("No meals found")
            } else {
                List(viewModel.meals) { meal in
                    NavigationLink(destination: MealDetailView(mealId: meal.idMeal)) {
                        Text(meal.strMeal)
                    }
                }
                .navigationTitle("Desserts")
            }
        }
    }
}

