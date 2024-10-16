import 'person.dart';

void main() {
  Person p1 = Person(name: "ahmed", age: 33, gender: Gender.female);
  Person p2 = Person.withoutGender(name: "Ali", age: 33);
  p1.display();
  p2.display();
}
