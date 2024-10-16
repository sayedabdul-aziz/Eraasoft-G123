enum Gender{
  male,female
}

class Person {
  // attr
  String? name;
  int? age;
  Gender? gender;

  // constructor
  // Person({required String name, required int age, required String gender}) {
  //   this.name = name;
  //   this.age = age;
  //   this.gender = gender;
  // }

  Person({required this.name, required this.age, required this.gender});
  Person.withoutGender({required this.name, required this.age});

  // methods
  void display() {
    print("name: $name, age: $age and gender: $gender");
  }
}
