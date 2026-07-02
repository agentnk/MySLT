# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased] - 2026-07-02

### Added
- **LoginView**: Introduced a new authentication view with email and password fields, styled similarly to the MySLT web portal with a dark and teal gradient design.
- **AuthViewModel**: Created a ViewModel to handle authentication state (`isAuthenticated`, `isLoading`, `errorMessage`) and mock login/logout flows.
- **Logout Functionality**: Added a "Log Out" button to the top right of the navigation bar in the main dashboard (`ContentView`).
- **Conditional Routing**: Updated `MySLTApp` to conditionally render `LoginView` or `ContentView` based on the user's authentication state using an injected `@EnvironmentObject`.

### Changed
- Refactored `ContentView` to accept `AuthViewModel` from the environment.
