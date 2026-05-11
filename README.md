# Habitt — Habit Tracker App

A Flutter-based habit tracking mobile application built as part of the IBM Mobile App Developer Professional Certificate capstone project.

---

## User Stories

### 1. Account Registration & Login
**As a new user**, I want to register with my name, username, email, and password so that I can create a personal account and access the app securely.
**As a returning user**, I want to log in with my email and password so that I can access my saved habits and progress.
**Acceptance criteria:**
- Sign-up screen has: name, username, email, password fields
- Login screen has: email and password fields with a sign-up link
- Validation errors shown inline for empty or invalid fields
- Incorrect credentials trigger a visible error message

---

### 2. Home Screen — Habit Overview
**As a user**, I want to see my daily habits separated into "To Do" and "Done" lists on the home screen so that I can quickly understand my progress for the day.
**Acceptance criteria:**
- Home screen shows a personalized greeting with the user's name
- Progress bar shows completed vs. total habits
- Habits can be swiped left to mark as done
- Completed habits can be swiped right to move back to To Do

---

### 3. Detail Screen — Configure Habits
**As a user**, I want to add new habits with a custom name and color so that I can personalize my habit list.
**As a user**, I want to delete habits I no longer need so that my list stays relevant.
**Acceptance criteria:**
- Detail screen shows an input field for habit name and a color picker
- Added habits appear in the list immediately
- Each habit shows a color indicator and a delete button
- Duplicate habits are rejected with an error message

---

### 4. Navigation & Menu
**As a user**, I want to access a side drawer menu so that I can navigate between the home screen, personal info, reports, notifications, and sign out.
**Acceptance criteria:**
- Hamburger icon opens a drawer with: Configure, Personal Info, Reports, Notifications, Sign Out
- Each menu item navigates to the correct screen
- The drawer displays the user's name and initials avatar

---

### 5. Personal Info (Profile)
**As a user**, I want to view and update my personal details (name, username, age, country) so that my profile stays accurate.
**Acceptance criteria:**
- Profile screen pre-fills with saved data from local storage
- Changes are persisted to SharedPreferences on save
- A success message is shown after saving
- The home screen greeting updates after saving

---

### 6. Reports Page
**As a user**, I want to view a weekly progress report for each of my habits so that I can understand how consistently I'm maintaining them.
**Acceptance criteria:**
- Reports screen shows a summary of total habits, completed entries, and completion rate
- A day-by-day grid shows ✅ or ❌ for each habit per day
- Score per habit shown as `done/7`
- Color-coded: green (≥5), orange (≥3), red (<3)

---

### 7. Notifications & Reminders
**As a user**, I want to enable notifications and select which habits and times I want to be reminded so that I stay on track with my goals.
**Acceptance criteria:**
- Toggle to enable/disable notifications
- Can select specific habits for reminders
- Can select reminder times: Morning, Afternoon, Evening
- "Send Test Notification" button triggers a visible notification dialog
- Settings are persisted across sessions

---

### 8. Sign Out
**As a user**, I want to securely sign out of my account so that my data is not accessible to others on shared devices.
**Acceptance criteria:**
- Sign Out option is available in the drawer menu
- Signing out clears session data from SharedPreferences
- User is redirected to the login screen

---

### 9. External API Integration (Country List)
**As a user**, I want to select my country from a dynamic list during registration and profile editing so that my profile is accurate.
**Acceptance criteria:**
- Country list is fetched from the REST Countries API (`restcountries.com`)
- Countries are sorted alphabetically
- A loading indicator is shown while fetching
- A fallback list is used if the API is unavailable

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| Local Storage | SharedPreferences |
| External API | REST Countries API |
| Notifications | In-app dialog (cross-platform) |
| State Management | StatefulWidget |

---

## Screens

| Screen | File |
|---|---|
| Login | `lib/login_screen.dart` |
| Register | `lib/register_screen.dart` |
| Home (Habit Tracker) | `lib/habit_tracker_screen.dart` |
| Configure Habits | `lib/add_habit_screen.dart` |
| Personal Info | `lib/personal_info_screen.dart` |
| Reports | `lib/reports_screen.dart` |
| Notifications | `lib/notifications_screen.dart` |

---

## Demo Credentials

```
Email:    testuser@habitt.com
Password: password123
```

---

## Getting Started

```bash
flutter pub get
flutter run
```
