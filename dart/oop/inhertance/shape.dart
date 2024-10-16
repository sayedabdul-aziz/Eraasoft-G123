// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class Shape {
  double d1;
  Shape(this.d1);
  getArea() {
    //
  }
}

class Circle extends Shape {
  Circle(super.d1);

  @override
  getArea() {
    print("Area is: ${pi * d1 * d1}");
  }
}

class Rectangle extends Shape {
  double d2;

  Rectangle(super.d1, this.d2);

  @override
  getArea() {
    print("Area is : ${d1 * d2}");
  }
}
