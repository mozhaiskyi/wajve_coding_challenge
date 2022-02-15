abstract class UserRoutePath {}

class Home extends UserRoutePath {}

class Details extends UserRoutePath {
  final int id;

  Details(this.id);
}
