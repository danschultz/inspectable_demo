# reflectable package demo

Simple demo to inspect the values of an object using the [reflectable] package. This package should have smaller output
than `dart:mirrors`.

## Usage

Mixin the `Inspectable` interface into one of your classes. You'll now have two methods:

* `inspect()`: returns a String the qualified name of the instance, its public fields and their values.
* `inspectValues()`: returns a Map where the keys are the fields of the instance, and the values are the field's values.

Example:

```dart
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

void main() {
  var address = new Address("408 Sherman Ave", "Palo Alto");
  var person = new Person("Jimmy", 65, address);

  print(person.inspect());
  print(address.inspect());
  
  // Outputs:
  //
  // Person {
  //   name: Jimmy
  //   age: 65
  //   address: Address {
  //     street: 408 Sherman Ave
  //     city: Palo Alto
  //   }
  // }
  //   
  // test_reflectable.person.Address {
  //   street: 408 Sherman Ave
  //   city: Palo Alto
  // }
}
```

## Running

* `pub serve`
* Open `http://localhost:3000`
* Open the console in DevTools to see printed output.

[reflectable]: https://pub.dartlang.org/packages/reflectable
