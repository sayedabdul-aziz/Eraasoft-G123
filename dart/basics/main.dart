void main() {
  // display("Ahmed", "male", 33);
  display1("Ahmed", 33, "Male");
  display2(gender: "male", name: "Ahmed", age: 33);
  display3(name: "ali", age: 34, gender: "Male");
  display4("ahmed", gender: "male", age: 22);
}

//1) Positional   (ordered , required)

void display(String name, String gender, int age) {
  print("name: $name, gender: $gender and age: $age");
}

//2) Positional   (ordered , required and optional)
void display1(String name, int age, [String gender = "male"]) {
  print("name: $name, gender: $gender and age: $age");
}

//3) Named   (not ordered , required)
void display2(
    {required String name, required String gender, required int age}) {
  print("name: $name, gender: $gender and age: $age");
}

//4) Named   (not ordered , required and optional)
void display3(
    {required String name, String gender = "male", required int age}) {
  print("name: $name, gender: $gender and age: $age");
}

//4) Mix
void display4(String name, {String gender = "male", required int age}) {
  print("name: $name, gender: $gender and age: $age");
}
