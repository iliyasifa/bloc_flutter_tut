import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EquatableTesting extends StatelessWidget {
  const EquatableTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const Person person = Person(name: 'i', age: '20');
          const Person person1 = Person(name: 'i', age: '20');

          if (kDebugMode) {
            print(person.hashCode.toString());
            print(person1.hashCode.toString());
            print(person == person1);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Person extends Equatable {
  final String name;
  final String age;

  const Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];

// @override
// bool operator ==(Object other) =>
//     identical(this, other) ||
//     other is Person &&
//         runtimeType == other.runtimeType &&
//         name == other.name &&
//         age == other.age;
//
// @override
// int get hashCode => name.hashCode ^ age.hashCode;
}
