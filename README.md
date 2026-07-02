# MySLT App

A SwiftUI-based macOS/iPadOS application acting as a self-care portal for MySLT.

## Features

- **Authentication**: A clean, modern login interface similar to the MySLT web portal.
- **Dashboard**: A main dashboard displaying broadband, PEOTV, voice, mobile, and promotion details.
- **State Management**: Uses SwiftUI's declarative state management (`@StateObject`, `@EnvironmentObject`) to manage authentication and user flow.

## Architecture

This project is built using:
- **SwiftUI** for the declarative UI framework.
- **MVVM (Model-View-ViewModel)** for separating the business logic and state from the views.

## Getting Started

1. Open the project in Xcode.
2. Select the `MySLTApp` target.
3. Build and run the application.

## Authentication (Mock)

Currently, the app uses a simulated login flow:
- Any non-empty email and password combination will succeed after a simulated 1.5-second network delay.
- Logging out will return the user immediately to the login portal.
