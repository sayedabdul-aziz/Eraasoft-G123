class Person {
  // attr.
  String? _name;
  String? _gender;
  int? _age;

  // setters and getters
  //  x,y
  // int res = (x>y)? x :(y>z)? y:z;
  void setName(String name) {
    this._name = name;
  }

  String getName() {
    return this._name ?? '';
  }

  set name(String name) {
    this._name = name;
  }

  String get name => this._name ?? '';

  setAge(int age) {
    if (age > 0) {
      this._age = age;
    } else {
      print("INVALID INPUT");
    }
  }

  int getAge() {
    //
    //
    return this._age ?? 0;
  }

  int getAge1() => this._age ?? 0;
}
