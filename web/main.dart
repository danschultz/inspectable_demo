// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:test_reflectable/models.dart';

void main() {
  var address = new Address("408 Sherman Ave", "Palo Alto");
  var person = new Person("Jimmy", 65, address);

  print(person.inspect());
  print(address.inspect());

//  print("Instance members: ${mirror.type.instanceMembers}");
//  print("Declerations: ${mirror.type.declarations}");
}


