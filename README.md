# MySLT App

A SwiftUI-based macOS application acting as a self-care portal for SLT-Mobitel broadband customers, closely mirroring the layout and branding of the official MySLT web portal.

## Screenshots

> Build and run in Xcode to see the live UI.

## Features

- **Authentication**: A login screen with email and password fields, styled with the MySLT navy blue branding. Supports a simulated login flow with loading state and error handling.
- **Dashboard**: The main dashboard replicating the MySLT web portal layout, including:
  - Top navigation tabs (Broadband, PEOTV, Voice, Mobile, Promotion) with tab icons
  - Sub-navigation tabs (Summary, Daily Usage, Gift Data, History, Redeem Data, Happy Day, More)
  - Package info and action buttons (Package Upgrade, Get Extra GB, Get data Add-ons)
  - Left panel with usage cards (My Package, Extra GB, Bonus Data, Add-Ons Data, Free Data)
  - Center panel showing current speed status and total GB usage
- **Right Sidebar**: Quick-action grid (New Services, Digital Life, Hot Device, Bill, Complaints), billing summary with Pay Now / Bill History, and Value Added Services icons.
- **Brand Colors**: Fully themed with the official MySLT color palette — deep navy backgrounds, bright blue accents, and green billing highlights.
- **Log Out**: A "Log Out" button in the top navigation bar returns users to the login screen.
- **State Management**: Uses SwiftUI's declarative state management (`@StateObject`, `@EnvironmentObject`, `@ObservedObject`) across all views.

## Architecture

Built using:
- **SwiftUI** for a fully declarative, native macOS UI.
- **MVVM (Model-View-ViewModel)** to separate business logic from view rendering.
- **Centralized Design System** (`Colors.swift`) defining the MySLT brand color palette as a `Color` extension.

## Project Structure

```
MySLTApp/
├── MySLTApp.swift              # App entry point & root navigation
├── Models/                     # Data models
├── ViewModels/
│   ├── AuthViewModel.swift     # Login/logout state & mock auth logic
│   └── DashboardViewModel.swift# Package & usage data
└── Views/
    ├── Colors.swift            # MySLT brand color palette
    ├── LoginView.swift         # Authentication screen
    ├── ContentView.swift       # Root layout & tab navigation
    ├── DashboardView.swift     # Main dashboard & usage cards
    ├── RightPanelView.swift    # Sidebar (billing, services, etc.)
    └── UsageCircleView.swift   # Circular data usage indicator
```

## Getting Started

### Prerequisites
- macOS 13+ (Ventura or later)
- Xcode 15+

### Running the App
1. Open the project in Xcode.
2. Select the `MySLTApp` target.
3. Build and run (`⌘R`).

## Authentication (Mock)

The app currently uses a simulated login flow:
- Any non-empty email and password combination will succeed after a 1.5-second simulated network delay.
- Logging out immediately returns the user to the login screen.
- To integrate real authentication, replace the `login(email:password:)` method in `AuthViewModel.swift` with actual API calls.

## Roadmap

- [ ] Integrate real MySLT API endpoints for live data
- [ ] Daily usage chart view
- [ ] Bill payment flow
- [ ] PEOTV, Voice, and Mobile tab content
- [ ] macOS menu bar integration
