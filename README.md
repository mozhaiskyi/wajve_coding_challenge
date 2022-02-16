# Wajve coding challenge

## Getting Started
To run project you need to have Flutter version 2.8.1.

## Description
User browser is a mobile application for iOS and Android which helps users to discover other users and contact them via email.
UI contains two parts. The first one is a list of users. The second one is the details page where users can find all available details about another user. Also, at the bottom of the details screen user can find the email button which initials email sent to the other user. It is useful for quick contact.

## Navigation
Thanks to using the Navigation 2 app works perfectly on WEB and deep linking is possible in the future.

One interesting point which I want to explain about navigation system.

There are two cases when the user navigates to the details page:
- The first one is when the app is opened and the user clicks on the User item. The details page will be opened with user data in a moment.
- The second one is when the user opens a link on the WEB with a URL like `app/users/{id}`. The app will download user data by id and open details after loading.

## Architecture
The app is split into different layers such as data, network, domain, view. I use the BLoC pattern to handle the app state. Also, I use the repository pattern to provide a general API for data sources.

## Test coverage
I use `flutter_test` and `mockito` packages for testing.
The test layer contains ui and unit tests.

## Third-party packages
- `json_annotation` is using for JSON parsing.
- `http` is using for http calls.
- `flutter_bloc` provides general classes to easily implement the BLoC pattern.
- `provider` is using for dependencies injections.
- `url_launcher` is using to initiate a phone call from the current device.