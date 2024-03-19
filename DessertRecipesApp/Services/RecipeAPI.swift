//
//  RecipeAPI.swift
//  DessertRecipesApp
//
//  Created by Dirgh Patel on 3/18/24.
//

import Foundation
import Combine

class RecipeAPI {
    static let shared = RecipeAPI() // Singleton instance

    private let baseURLString = "https://themealdb.com/api/json/v1/1/"

    // Fetch list of desserts
    func fetchDesserts() -> AnyPublisher<MealList, Error> {
        let dessertURLString = "\(baseURLString)filter.php?c=Dessert"
        guard let url = URL(string: dessertURLString) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MealList.self, decoder: JSONDecoder())
            .handleEvents(receiveSubscription: { _ in print("Attempting to fetch desserts...") },
                          receiveOutput: { print("Fetched desserts: \($0)") },
                          receiveCompletion: { print("Completed with: \($0)") },
                          receiveCancel: { print("Cancelled fetch desserts request") })
            .eraseToAnyPublisher()
    }

    
    // Fetch meal details by ID
    func fetchMealDetails(id: String) -> AnyPublisher<MealDetail, Error> {
        let detailURLString = "\(baseURLString)lookup.php?i=\(id)"
        guard let url = URL(string: detailURLString) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MealDetail.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

