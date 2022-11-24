# todo_bloc

You need to create a to-do app that has 3 screens: home, favorite and new to do. Please refer to the screenshots below:

<p align="center">
  <img src="assets/layout.jpg" />
</p>

We encourage you to use BLOC state management for this application but kindly avoid thebuild-in library or any external package except for bloc and flutter_bloc

Feature:

- Home page: Users can add and like to-dos and data needs to be refreshed according to
  the recent changes whenever the user takes an action in the favorite page.
- New Todo page: Users can create a new to-do on this screen and that
  BottomNavigationBar shouldn’t be hidden in the screen's display.
- Favorite page: When a user likes a to-do from the home page, that to-do should beplaced at the top of the favorite list. And if it gets disliked, that should be removed and updated accordingly in the home page.
