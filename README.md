# StarX

StarX is a social media application built using Flutter. It leverages modern technologies and design patterns to offer a seamless and interactive user experience. With a clean and intuitive interface, StarX allows users to connect, share, and engage with their friends and community.

## Technologies Used

- **Flutter**: Framework for building the app's UI.
- **MVVC Design Pattern**: For separating the presentation layer from business logic.
- **BLoC**: For state management and reactive programming.
- **Clean Code Principles**: To ensure the codebase is maintainable and scalable.
- **Google Firebase**: For authentication, database, and real-time updates.

## Features

- **Splash View**: Initial loading screen that introduces users to StarX.
- **Login and Register Page**: Secure user authentication and account creation.
- **News Feed**: View and interact with posts, including likes and comments.
- **Profile Page**: Manage and display user profile information.
- **Messages Page**: Access and manage direct messages with friends.
- **Chat Page**: Real-time chat functionality with text and media support.

## Screenshots

### Splash View
![Splash View](https://drive.google.com/uc?id=1kFMMx8ePSbXDaFPTuXaXxBbQsfxUd7Jb)
_The initial screen of the application._

### Login and Register Page
![Login and Register Page](https://drive.google.com/file/d/12siVdGwB_vGNvM0H880odhSXzg_43BSU/view?usp=drive_link)
_The login and registration forms for user authentication._

### News Feed
![News Feed](https://drive.google.com/file/d/1pZDxJXyJNUIxVL3BvlhNRKIf8N6x5NvL/view?usp=drive_link)
_View posts, like and comment on them._

### Profile Page
![Profile Page](https://drive.google.com/file/d/1cnlkyYlOzJ60RnfY-TdMy3iS9anHTSLI/view?usp=drive_link)
_Manage and view your personal profile._

### Messages Page
![Messages Page](https://drive.google.com/file/d/1tydTS_-hwqz1o5PGvXOZnmUoSqR9Q88L/view?usp=drive_link)
_View and manage your direct messages._

### Chat Page
![Chat Page](https://drive.google.com/file/d/1RZ7U0VlvOkH6Ob6eQNSu9UFdNUItAZzj/view?usp=drive_link)
_Engage in real-time chats with your contacts._

## Installation

To run the StarX app locally, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/vortexyj/starx.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd starx
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Run the application**:
    ```bash
    flutter run
    ```

## Configuration

Before running the app, make sure to configure Firebase for your project. Follow these steps to set up Firebase:

1. **Create a Firebase project**: Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.

2. **Add Firebase configuration files**: Download `google-services.json` (for Android) and/or `GoogleService-Info.plist` (for iOS) and place them in the appropriate directories:
   - Android: `android/app`
   - iOS: `ios/Runner`

3. **Update Firebase dependencies**: Ensure that your `pubspec.yaml` file includes the necessary Firebase dependencies.

## Contributing

Contributions are welcome! If you'd like to contribute to StarX, please fork the repository and submit a pull request. Make sure to follow the coding standards and include tests for new features or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, please reach out to [your email address or contact information].

---

Thank you for checking out StarX! We hope you enjoy using the app and find it useful.

