library inspectable_demo.models;

import 'inspectable.dart';

class Person extends Object with Inspectable {
  final String name;
  final int age;
  final Address address;

  Person(this.name, this.age, this.address);

  void sayHi() {
    print("hi");
  }
}

class Address extends Object with Inspectable {
  final String street;
  final String city;

  Address(this.street, this.city);
}
