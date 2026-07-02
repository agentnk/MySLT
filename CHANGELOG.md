# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

## [0.2.0] - 2026-07-02

### Added
- **`Colors.swift`**: Introduced a centralized MySLT brand color palette as a `Color` extension, defining:
  - `sltNavyBg` — Deep navy `#0A1738` for main backgrounds
  - `sltDarkCard` — Dark blue `#122252` for cards and panels
  - `sltMedBlue` — Medium blue for unselected tab buttons
  - `sltBrightBlue` — Bright blue `#0F70D9` for selected states and accents
  - `sltLightBlue` — Light blue for action buttons
  - `sltGreen` — Green `#22A64C` for billing and payment elements
  - `sltSubTabBg` — Dark navy for the sub-tab bar background

### Changed
- **`ContentView.swift`**: Updated top navigation bar to use MySLT brand colors. Added tab icons (SF Symbols) alongside tab labels.
- **`DashboardView.swift`**: Fully rethemed to match the official MySLT web portal:
  - Sub-tab bar now uses `sltSubTabBg` with bright blue highlight for the selected tab
  - Package info row and action buttons (`Package Upgrade`, `Get Extra GB`, `Get data Add-ons`) styled with `sltLightBlue`
  - Usage cards updated — selected card uses `sltBrightBlue`, unselected cards use `sltDarkCard`
  - Center panel uses `sltDarkCard` background; GB usage text styled in purple accent color to match portal
- **`RightPanelView.swift`**: Updated to MySLT brand colors:
  - Quick-action grid buttons use `sltDarkCard` background with `sltBrightBlue` icons
  - Billing section uses green (`sltGreen`) for total payable label and Pay Now / Bill History buttons
  - Service icon tiles use `sltLightBlue` background
- **`LoginView.swift`**: Updated to MySLT navy/blue theme — left branding panel uses a navy-to-blue gradient; form fields use `sltDarkCard` with `sltMedBlue` borders; Sign In button uses `sltBrightBlue`
- **`UsageCircleView.swift`**: Updated progress ring to use `sltMedBlue` for the background track and a purple accent for the progress arc, matching the portal's usage indicator style

---

## [0.1.0] - 2026-07-02

### Added
- **`AuthViewModel.swift`**: Created `AuthViewModel` as an `ObservableObject` to manage authentication state (`isAuthenticated`, `isLoading`, `errorMessage`). Provides mock `login(email:password:)` and `logout()` functions.
- **`LoginView.swift`**: New two-column login screen with email and password fields, loading indicator, and error message display. Styled with a gradient branding panel on the left.
- **Log Out Button**: Added a "Log Out" button to the top navigation bar in `ContentView`.
- **`README.md`**: Created project documentation.
- **`CHANGELOG.md`**: Created this changelog.

### Changed
- **`MySLTApp.swift`**: Updated app entry point to inject `AuthViewModel` as a `@StateObject` and conditionally render `LoginView` or `ContentView` based on `isAuthenticated`.
- **`ContentView.swift`**: Added `@EnvironmentObject var authViewModel: AuthViewModel` to support logout functionality.
