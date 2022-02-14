enum Gender { male, female, unknown }

enum Status { active, inactive, unknown }

class User {
  final int id;
  final String name;
  final String email;
  final Gender gender;
  final Status status;

  User(this.id, this.name, this.email, this.gender, this.status);
}
