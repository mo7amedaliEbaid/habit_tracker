### User Story

**As a user, I want to register with my name, username, age, and country so that I can create an account and access personalized habit-tracking features.**

### Acceptance Criteria 1

- **Given** the user is on the registration screen  
- **When** the user fills in all required fields (name, username, age, and country) and clicks the "Sign Up" button  
- **Then** the application creates a new account, loads the Home screen, and displays the user's name in the header.

### Acceptance Criteria 2

- **Given** the user has left one or more required fields blank or entered invalid data  
- **When** the user clicks the "Sign Up" button  
- **Then** the application displays an error message indicating which fields need attention.

### Priority

High

### Story Points

_No response_

### Notes

- Validate all user inputs (e.g., ensure age is a number and username is unique) before account creation.
- Ensure the registration screen and Home screen follow the app's design guidelines for consistency.
- Additional fields (such as email and password) might be considered for future enhancements.


### User Story

*As a user, I want to log in using my username and password so that I can access my account and track my habits.*

### Acceptance Criteria 1

- **Given** the user is on the login screen  
- **When** the user enters a valid username and password and clicks the "Login" button  
- **Then** the application loads the Home screen and displays the user's name in the header.

### Acceptance Criteria 2

- **Given** the user is on the login screen  
- **When** the user clicks the "Sign Up" button  
- **Then** the application navigates to the registration page.

### Acceptance Criteria 3

- **Given** the user is on the login screen  
- **When** the user enters a non-existent username or an incorrect password and clicks the "Login" button  
- **Then** the application displays a toast error message indicating that the login attempt was unsuccessful.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to receive a message if I enter the wrong username or password so that I know my login attempt was unsuccessful.*

### Acceptance Criteria 1

- **Given** the user is on the login screen  
- **When** the user enters invalid credentials  
- **Then** the application displays a toast error message indicating that the username or password is incorrect

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to see a personalized welcome message with my name on the homepage so that I feel recognized and can confirm I am logged into the correct account.*

### Acceptance Criteria 1

- **Given** the user has successfully logged in  
- **When** the homepage loads  
- **Then** the application displays a welcome message that includes the user's name.

### Acceptance Criteria 2

- **Given** the user's profile data is correctly retrieved from the backend or local storage  
- **When** the homepage is rendered  
- **Then** the welcome message should dynamically update to reflect the correct name of the logged-in user.

### Acceptance Criteria 3

- **Given** the user is not logged in or there is an error fetching user details  
- **When** the homepage loads  
- **Then** the application should either display a generic welcome message (e.g., "Welcome!") or prompt the user to log in again.

### Priority

High

### Story Points

_No response_

### Notes

- Ensure the personalized message adheres to the application's design and accessibility guidelines.
- Consider adding unit and integration tests to verify that the correct message is displayed under various conditions.
### User Story

*As a user, I want to see my daily progress for each habit on the homepage, so that I can easily monitor my progress.*

### Acceptance Criteria 1

- **Given** that the user has set up one or more habits  
- **When** the homepage loads  
- **Then** the application displays the current daily progress for each habit, such as a progress bar, percentage, or numerical value.

### Acceptance Criteria 2

- **Given** that the user has made progress on a habit during the day  
- **When** the homepage is refreshed or revisited  
- **Then** the displayed progress updates in real-time to reflect the latest data.

### Acceptance Criteria 3

- **Given** that a habit has no recorded progress for the current day  
- **When** the homepage loads  
- **Then** the application shows an appropriate indicator (e.g., "No progress recorded yet" or a zero-progress state) for that habit.

### Priority

High

### Story Points

_No response_

### Notes

- Ensure the progress indicators are visually consistent with the overall design of the application.  
- Consider adding tooltips or additional information to help users understand what each progress indicator represents.
### User Story

*As a user, I want to see a section for completed habits on the homepage, so that I can track what I have already achieved.*

### Acceptance Criteria 1

- **Given** the user has marked one or more habits as completed  
- **When** the homepage loads  
- **Then** the application displays a dedicated "Completed Habits" section that lists all completed habits.

### Acceptance Criteria 2

- **Given** the user has no completed habits  
- **When** the homepage loads  
- **Then** the "Completed Habits" section either remains hidden or shows a placeholder message (e.g., "No habits completed yet") to inform the user.

### Acceptance Criteria 3

- **Given** the user completes a habit during the session  
- **When** the homepage is refreshed or updated in real-time  
- **Then** the newly completed habit is added to the "Completed Habits" section, ensuring the display accurately reflects the user’s progress.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to access a menu with options for configuring my habits, viewing reports, editing my profile, and signing out, so that I can easily navigate to different parts of the app.*

### Acceptance Criteria 1

- **Given** the user is logged in  
- **When** the user taps on the menu icon (e.g., a hamburger icon or profile avatar)  
- **Then** the application displays a menu containing the options: "Habits", "Personal info", "Reports", "Notifications", and "Sign Out".

### Acceptance Criteria 2

- **Given** the menu is open  
- **When** the user taps on any menu option  
- **Then** the application navigates to the corresponding screen (e.g., tapping "View Reports" takes the user to the reports screen) with appropriate transition animations.

### Acceptance Criteria 3

- **Given** the menu is open  
- **When** the user taps outside the menu area or selects an option  
- **Then** the menu automatically closes, ensuring a smooth and intuitive user experience.

### Priority

High

### Story Points### User Story

*As a user, I want to access the profile page from the menu, so that I can configure and manage my personal data.*

### Acceptance Criteria 1

- **Given** the user is logged in and has opened the menu  
- **When** the user taps on the "Edit Profile" or "Profile" option  
- **Then** the application navigates to the profile page where the user can view and update their personal data.

### Acceptance Criteria 2

- **Given** the profile page is loaded  
- **When** the user views the page  
- **Then** the page displays the user's current personal data (e.g., name, email, profile picture) and provides options to edit each field.

### Acceptance Criteria 3

- **Given** the user makes changes to their personal data  
- **When** the user taps the "Save" or "Update" button  
- **Then** the application validates the input, saves the updated data, and provides feedback (e.g., a confirmation message) that the changes have been successfully applied.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to access the habits page from the menu, so that I can configure and manage my habits.*

### Acceptance Criteria 1

- **Given** the user is logged in and has opened the menu  
- **When** the user taps on the "Habits" option in the menu  
- **Then** the application navigates to the habits page

### Acceptance Criteria 2

- **Given** the habits page is loaded  
- **When** the user views the page  
- **Then** the page displays a list of all current habits along with options to add, edit, or delete a habit

### Acceptance Criteria 3

- **Given** the user performs an action on the habits page (such as adding, editing, or deleting a habit)  
- **When** the action is completed  
- **Then** the habits list updates immediately to reflect the change and shows a confirmation message

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to sign out of my account using an option in the menu, so that I can securely log out when I'm finished using the app.*

### Acceptance Criteria 1

- **Given** the user is logged in and has opened the menu  
- **When** the user taps on the "Sign Out" option  
- **Then** the application logs the user out and terminates the current session.

### Acceptance Criteria 2

- **Given** the user has successfully signed out  
- **When** the sign-out process is completed  
- **Then** the application navigates the user to the login screen or a welcome screen.

### Acceptance Criteria 3

- **Given** the user initiates the sign-out action  
- **When** the action is confirmed (if a confirmation dialog is presented) or immediately upon tapping  
- **Then** the application clears any sensitive user data from memory and local storage, ensuring a secure log-out process.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to view my saved name, username, age, and country on my profile page, so that I can see the details I provided during registration.*

### Acceptance Criteria 1

- **Given** the user is logged in and navigates to the profile page  
- **When** the profile page loads  
- **Then** the application displays the user's saved name, username, age, and country as provided during registration.

### Acceptance Criteria 2

- **Given** the user's registration data is stored in the backend or local storage  
- **When** the profile page is rendered  
- **Then** the application retrieves the most up-to-date user information and displays it accurately.

### Acceptance Criteria 3

- **Given** the profile page is being viewed  
- **When** the data is presented  
- **Then** the details are clearly labeled (e.g., "Name", "Username", "Age", "Country") and formatted according to the app's design guidelines for readability.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to update my name, username, age, and country on my profile page, so that I can keep my information up to date.*

### Acceptance Criteria 1

- **Given** the user is on the profile page with their current personal details pre-populated in the editable fields  
- **When** the profile page loads  
- **Then** the application displays the current values for name, username, age, and country in the corresponding input fields.

### Acceptance Criteria 2

- **Given** the user makes changes to any of the fields (name, username, age, or country)  
- **When** the user clicks the "Save" or "Update" button  
- **Then** the application validates the input, updates the user's information in the backend or local storage, and displays a confirmation message indicating that the profile has been updated.

### Acceptance Criteria 3

- **Given** the user enters invalid or incomplete information (e.g., leaving a required field empty or entering an invalid age)  
- **When** the user attempts to save the changes  
- **Then** the application displays appropriate error messages next to the corresponding fields, preventing the update until the errors are resolved.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want the changes I make to my profile to be saved, so that my updated details are stored and reflected throughout the app.*

### Acceptance Criteria 1

- **Given** the user is on the profile page with editable fields for name, username, age, and country  
- **When** the user updates one or more of these fields and clicks the "Save" or "Update" button  
- **Then** the application validates and saves the updated details to the backend or local storage and displays a success confirmation message.

### Acceptance Criteria 2

- **Given** the user's profile has been successfully updated  
- **When** the user navigates to any section of the app that displays profile information (such as the home screen header or the profile page)  
- **Then** the application displays the updated profile details accurately.

### Acceptance Criteria 3

- **Given** the user enters invalid or incomplete data during the profile update  
- **When** the user attempts to save the changes  
- **Then** the application prevents saving and displays appropriate error messages indicating what needs to be corrected.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want my updated name to be displayed in the app's header after I change it in the profile, so that my changes are immediately visible.*

### Acceptance Criteria 1

- **Given** the user is on the profile page and has updated their name  
- **When** the user clicks the "Save" or "Update" button  
- **Then** the application saves the updated name and immediately reflects it in the app's header.

### Acceptance Criteria 2

- **Given** the user's name has been updated successfully  
- **When** the user navigates to any other section of the app (or refreshes the current view)  
- **Then** the updated name is consistently displayed across all app headers and relevant sections.

### Acceptance Criteria 3

- **Given** the user attempts to update their name  
- **When** the update operation fails due to an error (e.g., network or validation issues)  
- **Then** the application displays an appropriate error message and retains the previous name in the header until the update is successful.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to add new habits on the details configuration page so that I can manage and update my habits as needed.*

### Acceptance Criteria 1

- **Given** the user is on the habit details configuration page  
- **When** the user taps on the "Add Habit" button  
- **Then** the application displays a form or input fields for entering the new habit's details (e.g., habit name, frequency, description).

### Acceptance Criteria 2

- **Given** the user has entered the new habit's details  
- **When** the user submits the form  
- **Then** the application validates the input data and adds the new habit to the user's list of habits if the input is valid.

### Acceptance Criteria 3

- **Given** the new habit is successfully added  
- **When** the habit details configuration page refreshes or updates  
- **Then** the newly added habit is immediately visible in the list of habits and available for further editing or management.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to delete existing habits so that I can keep my habits up to date.*

### Acceptance Criteria 1

- **Given** the user is on the habits configuration page or viewing a list of their habits  
- **When** the user selects a habit and taps the "Delete" option/icon  
- **Then** the application displays a confirmation dialog asking if the user is sure they want to delete the habit.

### Acceptance Criteria 2

- **Given** the confirmation dialog is displayed  
- **When** the user confirms the deletion  
- **Then** the application removes the habit from the user's list and updates the display immediately.

### Acceptance Criteria 3

- **Given** the deletion is successful  
- **When** the habit is removed  
- **Then** the application displays a notification or toast message confirming that the habit has been deleted, and the updated list reflects this change.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to assign a specific color to each habit to make it personal to me.*

### Acceptance Criteria 1

- **Given** the user is on the habit configuration or details page  
- **When** the user selects a habit and taps the "Edit" or "Customize" option  
- **Then** the application displays a color picker allowing the user to choose from a range of colors.

### Acceptance Criteria 2

- **Given** the color picker is displayed  
- **When** the user selects a specific color and confirms the choice  
- **Then** the application assigns the selected color to the habit and updates the habit's display (e.g., background or icon color) accordingly.

### Acceptance Criteria 3

- **Given** the habit has been updated with a new color  
- **When** the user navigates through the app (e.g., returning to the habits list or refreshing the page)  
- **Then** the selected color is persistently displayed for the habit, ensuring the personalization remains consistent across sessions.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to see a report of my weekly habit progress so that I can understand how well I am maintaining my habits.*

### Acceptance Criteria 1

- **Given** the user has been tracking their habits throughout the week  
- **When** the user navigates to the reports section or selects "Weekly Report"  
- **Then** the application displays a report summarizing the weekly progress for each habit (e.g., completion rates, missed days, trends).

### Acceptance Criteria 2

- **Given** the weekly report is displayed  
- **When** the user views the report  
- **Then** the report presents the data in a clear and visually engaging format (e.g., charts, graphs, or progress bars) that highlights the user's performance over the week.

### Acceptance Criteria 3

- **Given** the user interacts with the weekly report  
- **When** the user selects a specific habit from the report  
- **Then** the application provides detailed insights or historical data related to that habit for further analysis.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to see a chart of my completed habits for each day of the week so that I can quickly identify trends in my progress.*

### Acceptance Criteria 1

- **Given** the user has recorded habit completions throughout the week  
- **When** the user navigates to the reports section or dashboard  
- **Then** the application displays a chart that shows the number of completed habits for each day of the week.

### Acceptance Criteria 2

- **Given** the chart is displayed  
- **When** the user views the chart  
- **Then** the data is presented in a clear and visually appealing format (e.g., bar chart, line graph) that accurately represents daily completions.

### Acceptance Criteria 3

- **Given** the user interacts with the chart (e.g., tapping on a specific day)  
- **When** the interaction occurs  
- **Then** the application provides detailed information for that day, such as the list of completed habits or additional statistics.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to see both completed and incomplete habits in my report so that I have a comprehensive view of my habit tracking performance.*

### Acceptance Criteria 1

- **Given** the user has recorded data for their habits over a period  
- **When** the user navigates to the reports section  
- **Then** the application displays a report that clearly distinguishes between completed and incomplete habits.

### Acceptance Criteria 2

- **Given** the report is displayed  
- **When** the user views the report  
- **Then** the application presents the data in a visually engaging format (e.g., separate charts or sections) that highlights the number or percentage of completed versus incomplete habits.

### Acceptance Criteria 3

- **Given** the user interacts with the report (e.g., by selecting a specific habit or date range)  
- **When** the interaction occurs  
- **Then** the application provides detailed breakdowns, such as trends over time, enabling the user to analyze both successes and areas needing improvement.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to be able to enable or disable notifications for the app, so that I can choose whether or not to receive reminders for my habits.*

### Acceptance Criteria 1

- **Given** the user is on the app's settings or notifications configuration page  
- **When** the user views the notification settings  
- **Then** the application displays an option (e.g., a toggle switch) that indicates whether notifications are enabled or disabled.

### Acceptance Criteria 2

- **Given** the notification toggle is displayed  
- **When** the user toggles the option to enable or disable notifications  
- **Then** the application saves the user's preference and adjusts the notification behavior accordingly.

### Acceptance Criteria 3

- **Given** the user has updated the notification settings  
- **When** the user navigates away from and then returns to the settings page  
- **Then** the application consistently reflects the user's selected notification preference.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to select specific habits to receive notifications for, so that I only get reminders for the habits I am actively working on.*

### Acceptance Criteria 1

- **Given** the user is on the notification settings or habits configuration page  
- **When** the page loads  
- **Then** the application displays a list of all the user's habits, each with an option (such as a toggle switch or checkbox) to enable or disable notifications for that habit.

### Acceptance Criteria 2

- **Given** the user sees the list of habits with notification controls  
- **When** the user toggles the notification setting for a specific habit  
- **Then** the application updates the notification preference for that habit immediately and provides visual feedback confirming the change.

### Acceptance Criteria 3

- **Given** the user has configured the notification settings for their habits  
- **When** a notification is scheduled based on the user's preferences  
- **Then** the application sends reminder notifications only for the habits with notifications enabled, while ignoring those that have been disabled.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to have the option to receive notifications three times a day (morning, afternoon, evening) for all selected habits, so that I get timely reminders throughout the day to complete my habits.*

### Acceptance Criteria 1

- **Given** the user has selected specific habits for notifications  
- **When** the user navigates to the notification settings  
- **Then** the application displays toggle options for receiving notifications in the morning, afternoon, and evening.

### Acceptance Criteria 2

- **Given** the user has enabled notifications for the specified time slots  
- **When** the daily notification schedule is executed  
- **Then** the application sends reminders for all selected habits at the designated morning, afternoon, and evening times.

### Acceptance Criteria 3

- **Given** the user adjusts the notification preferences (e.g., disabling one of the time slots or changing the times)  
- **When** the user saves their settings  
- **Then** the notification schedule is updated accordingly, ensuring that reminders are only sent for the enabled time slots.

### Priority

High

### Story Points

_No response_

### Notes

_No response_
### User Story

*As a user, I want to see all my data is saved in local storage so that the data persists between app sessions.*


### Acceptance Criteria 1

- **Given** that the user has performed actions that modify data (e.g., adding or editing habits, progress updates, or settings)   
- **When** the app completes these actions   
- **Then** the application automatically saves the updated data to local storage.

### Acceptance Criteria 2

- **Given** that the user closes the app or ends a session  
- **When** the user reopens the app   
- **Then** the application retrieves and loads all previously saved data from local storage, ensuring a seamless continuation of their experience.

### Acceptance Criteria 3

- **Given** that the user is offline or has network issues   
- **When** the app is restarted  
- **Then** the application still loads the data from local storage, guaranteeing data persistence regardless of connectivity.

### Priority

High

### Story Points

_No response_

### Notes

_No response_### User Story

*As a user, I want the app to integrate with an external API to retrieve a list of countries, so that I can select my country during registration without manual data entry.*

### Acceptance Criteria 1

- **Given** the user navigates to the registration screen  
- **When** the registration form loads  
- **Then** the application automatically fetches the list of countries from the external API and populates the country dropdown field.

### Acceptance Criteria 2

- **Given** the external API is unreachable or returns an error  
- **When** the app attempts to retrieve the countries list  
- **Then** the application displays a fallback static list of countries to ensure uninterrupted user experience.

### Acceptance Criteria 3

- **Given** the countries list (either fetched from the API or the fallback list) is displayed  
- **When** the user interacts with the country dropdown  
- **Then** the list is scrollable, searchable, and allows the user to select their country efficiently.

### Priority

High

### Story Points

_No response_

### Notes

- Ensure that the API integration handles latency gracefully and includes error handling/logging.
- The API response should be cached locally to improve performance on subsequent visits to the registration screen.

