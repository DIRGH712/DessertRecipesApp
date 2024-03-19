//
//  MealListViewModel.swift
//  DessertRecipesApp
//
//  Created by Dirgh Patel on 3/18/24.
//

import Foundation
import Combine

class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchDesserts()
    }

    func fetchDesserts() {
        RecipeAPI.shared.fetchDesserts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break // Successfully fetched the data
                case .failure(let error):
                    print(error.localizedDescription) // Handle the error appropriately
                }
            }, receiveValue: { [weak self] mealList in
                self?.meals = mealList.meals
            })
            .store(in: &cancellables)
    }
}
