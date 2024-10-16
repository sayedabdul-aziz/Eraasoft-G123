class Person {
  String? name;
  String? id;
  Person({this.id, this.name});

  display() {
    print("$id : $name");
  }
}

class Student extends Person {
  String? degree;

  Student(this.degree, {super.name, super.id});
  // Student(this.degree, {String? id, String? name}) : super(id: id, name: name);

  @override
  display() {
    super.display();
    print("$id : $name : $degree");
  }
}

class Doctor extends Person {
  double? salary;

  Doctor(this.salary, {super.id, super.name});

  @override
  display() {
    print("$id : $name : $salary");
  }
}


// Example :

// class (Shape)  => getArea()

// Circle => getArea()  pi*r*r

// Rectangle => getArea()  d1*d2

