# DessertRecipesApp

Dessert Recipes App is an iOS application built using SwiftUI and Combine. It allows users to browse and explore a variety of dessert recipes, providing details such as ingredients, instructions, and meal photos. This app utilizes TheMealDB API for fetching the recipes.

## Features

- Browse a list of dessert recipes sorted alphabetically.
- View detailed information about each dessert, including ingredients, instructions, and images.

## Getting Started

### Prerequisites

- macOS Big Sur (11.0) or later.
- Xcode 12.0 or later.
- iOS 14.0 or later for running the app on a device or simulator.

### Installation

1. **Clone the repository**
  ```bash
    git clone https://github.com/yourusername/DessertRecipesApp.git
  ```
2. **Open the project in Xcode**

Navigate to the cloned repository's directory and open the `DessertRecipesApp.xcodeproj` file.

3. **Install dependencies**

This project doesn't rely on external dependencies.

4. **API Key**

TheMealDB API used in this project is open and doesn't require an API key for the endpoints we're using.

### Running the App

Select an iOS simulator or connect an iOS device and select it as the run destination. Click the Run button in Xcode or press `Cmd + R` to build and run the app.

## Usage

Upon launching, the app presents a list of desserts. Tapping on any dessert navigates to a detailed view showing the recipe's name, instructions, and ingredients. Swipe back or tap the back navigation to return to the list.

## Architecture

The app follows the MVVM architectural pattern to separate the UI (View) from the business logic (ViewModel) and data (Model), promoting maintainability and testability.

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Acknowledgments

- [TheMealDB API](https://www.themealdb.com/api.php) for providing the dessert recipes data.


