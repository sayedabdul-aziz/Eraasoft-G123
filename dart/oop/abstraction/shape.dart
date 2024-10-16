import 'dart:math';

abstract class Area {
  void getArea();
}

abstract class Perimeter {
  void getPerimeter();
}

class Circle implements Area, Perimeter {
  double r;
  Circle(this.r);
  @override
  void getArea() {
    print('Area: ${pi * r * r}');
  }

  @override
  void getPerimeter() {
    print('Perimeter: ${2 * pi * r}');
  }
}

// Pending
// accept
// reject
//refunded

//1,2,3,4

enum PaymentState {
  Pending,
  accept,
  reject,
  refunded,
}

PaymentState getStateEnum(state) {
  switch (state) {
    case 1:
      return PaymentState.Pending;
    case 2:
      return PaymentState.accept;
    case 3:
      return PaymentState.reject;
    case 4:
      return PaymentState.refunded;
  }
  return PaymentState.Pending;
}


