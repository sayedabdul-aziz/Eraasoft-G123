import 'person.dart';

void main() {
  Person p = Person();
  p.name = "Ahmed";
  p.setName("Ahmed");
  p.getName();
  print(p.name);
}
