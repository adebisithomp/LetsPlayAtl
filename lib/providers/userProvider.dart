import 'package:lets_play_atl/model/User.dart';

abstract class EventOrganizerProvider {

}


abstract class CitizenProvider {
  bool login(String user, pass);
  User getCurrentUser();
  bool isLoggedIn(); // If a logged in user is currently stored in app
}

class MockCitizenProvider extends CitizenProvider {
  User fakeUser = User("Jane", "Doe", "jd@gmail.com");
  bool didLogIn;

  MockCitizenProvider() {
    didLogIn = false;
  }
  bool isLoggedIn() {
    return didLogIn;
  }
  @override
  User getCurrentUser() {
    if (didLogIn) {
      return fakeUser;
    } else {
      return null;
    }
  }

  @override
  bool login(String user, pass) {
    if (fakeUser.name == user && fakeUser.password == pass) {
      didLogIn = true;
    }
    return didLogIn;
  }

}

class APICitizenProvider extends CitizenProvider {
  //Actually calls api
  @override
  User getCurrentUser() {
    // TODO: implement getCurrentUser
    return null;
  }

  @override
  bool login(String user, pass) {
    // TODO: implement login
    return null;
  }

  @override
  bool isLoggedIn() {
    // TODO: implement isLoggedIn
    return null;
  }

}