//
//  MealDetailView.swift
//  DessertRecipesApp
//
//  Created by Dirgh Patel on 3/18/24.
//

import SwiftUI
import Combine

struct MealDetailView: View {
    let mealId: String
    @State private var mealDetail: Detail?
    @State private var isLoading = true
    @State private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    if let mealDetail = mealDetail, let mealThumbURL = mealDetail.strMealThumb {
                        AsyncImage(url: mealThumbURL) { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 600)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding()
                    }
                    
                    Text(mealDetail?.strMeal ?? "Unknown Meal")
                        .font(.title)
                        .padding(.bottom, 2)
                    
                    Text("Instructions")
                        .font(.headline)
                        .padding(.vertical, 2)
                    
                    Text(mealDetail?.strInstructions ?? "No instructions available")
                        .padding(.bottom, 2)
                    
                    if let ingredients = mealDetail?.ingredients, let measurements = mealDetail?.measurements, !ingredients.isEmpty {
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.vertical, 2)
                        
                        ForEach(Array(zip(ingredients, measurements)), id: \.0) { ingredient, measurement in
                            Text("- \(ingredient): \(measurement)")
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Meal Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadMealDetail()
        }
    }
    
    private func loadMealDetail() {
        RecipeAPI.shared.fetchMealDetails(id: mealId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { mealDetailResponse in
                self.mealDetail = mealDetailResponse.meals.first
            })
            .store(in: &cancellables)
    }
}
