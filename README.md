# MySLT App

A SwiftUI-based macOS application acting as a self-care portal for SLT-Mobitel broadband customers, closely mirroring the layout and branding of the official MySLT web portal.

## Features

### Authentication
- **SLTMOBITEL Branded Login Screen** matching the official MySLT app design:
  - `// SLTMOBITEL — The Connection` logo with blue slash mark, white/green branding
  - **"Welcome Back"** heading with subtitle
  - **User ID** field (email or mobile number) with person icon and red required asterisk
  - **Password** field with lock icon, show/hide eye toggle, and red required asterisk
  - **Remember Me** checkbox (custom blue checkbox style)
  - **Forgot Password?** link
  - Large **Sign In** bright blue button
  - **Version 1.0.0 | ● Online** status indicator in the footer
- **Right panel** with dark green radial gradient, "FASTEST / MOST STABLE / UNSTOPPABLE FibreOn" marketing text, SLTMOBITEL branding, and dot page indicators

### Dashboard
The main dashboard replicates the MySLT web portal layout:
- **Top navigation tabs** — Broadband (with wifi icon), PEOTV, Voice, Mobile, Promotion — with a Log Out button on the right
- **Sub-navigation tabs** — Summary, Daily Usage, Gift Data, History, Redeem Data, Happy Day, More
- **Package info row** — Package name, status, username on the left; Package Upgrade / Get Extra GB / Get data Add-ons action buttons on the right
- **Left usage cards** — My Package (selected, bright blue), Extra GB, Bonus Data, Add-Ons Data, Free Data
- **Center panel** — Speed status badge (NORMAL), Total Usage, large GB display in purple, validity info
- **Right sidebar** — 3×2 quick-action grid (New Services, Digital Life, Hot Device, Bill, Complaints, More), promotional banner, billing section (Total Payable with green Pay Now / Bill History buttons), Value Added Services icons (Duthaya, Kaspersky, PEO MOBILE, SLT Kimaki, Storage)

### Design System
- **Centralized brand colors** in `Colors.swift` — deep navy backgrounds, bright blue accents, green billing highlights — matching the official MySLT portal palette
- **State Management** via `@StateObject`, `@EnvironmentObject`, and `@ObservedObject`

## Architecture

Built using:
- **SwiftUI** for a fully declarative, native macOS UI
- **MVVM (Model-View-ViewModel)** to separate business logic from view rendering
- **Centralized Design System** (`Colors.swift`) defining the MySLT brand color palette as a `Color` extension

## Project Structure

```
MySLTApp/
├── MySLTApp.swift              # App entry point & root navigation
├── Models/                     # Data models
├── ViewModels/
│   ├── AuthViewModel.swift     # Login/logout state & mock auth logic
│   └── DashboardViewModel.swift# Package & usage data
└── Views/
    ├── Colors.swift            # MySLT brand color palette extension
    ├── LoginView.swift         # Authentication screen (SLTMOBITEL branded)
    ├── ContentView.swift       # Root layout & tab navigation
    ├── DashboardView.swift     # Main dashboard & usage cards
    ├── RightPanelView.swift    # Sidebar (billing, services, quick actions)
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
4. Log in with any non-empty email and password (mock authentication).

## Authentication (Mock)

The app currently uses a simulated login flow:
- Any non-empty User ID and password combination will succeed after a 1.5-second simulated network delay.
- Logging out immediately returns the user to the login screen.
- To integrate real authentication, replace the `login(email:password:)` method in [`AuthViewModel.swift`](MySLTApp/ViewModels/AuthViewModel.swift) with actual SLT API calls.

## Roadmap

- [ ] Integrate real MySLT API endpoints for live data
- [ ] Daily usage chart view
- [ ] Bill payment flow
- [ ] PEOTV, Voice, and Mobile tab content
- [ ] macOS menu bar widget
- [ ] Persistent login with Keychain
