import 'package:object_builder/object_builder_annotation.dart';

part 'example.g.dart';

@ObjectBuilder()
class Job {
  String name;
  int salary;

  Job(this.name, this.salary);

  static $JobBuilder builder() => $JobBuilder();

  @override
  String toString() {
    return 'Job{name: $name, salary: $salary}';
  }
}

@ObjectBuilder()
class Address {
  String city;
  String street;

  Address(this.city, this.street);

  static $AddressBuilder builder() => $AddressBuilder();

  @override
  String toString() {
    return 'Address{city: $city, street: $street}';
  }
}

@ObjectBuilder()
class Person {
  String firstName;
  String? middleName;
  String lastName;
  int age;
  Job job;
  Address? address;

  Person(this.firstName, this.lastName, this.age,
      {required this.job, this.middleName});

  static $PersonBuilder builder() => $PersonBuilder();

  @override
  String toString() {
    return 'Person{firstName: $firstName, middleName: $middleName, lastName: $lastName, age: $age, job: $job, address: $address}';
  }
}

void main() {
  var jobBuilder = Job.builder();
  var job = jobBuilder.name("Developer").salary(100000).build();

  var personBuilder = Person.builder();
  var person = personBuilder
      .firstName("John")
      .middleName("William")
      .lastName("Doe")
      .age(30)
      .job(job)
      .build();

  print(person);

  var addressBuilder = Address.builder();
  var address = addressBuilder.city("New York").street("Wall Street").build();

  personBuilder = Person.builder();
  person = personBuilder
      .firstName("John")
      .middleName("William")
      .lastName("Doe")
      .age(30)
      .job(job)
      .address(address) // optional
      .build();

  print(person);
}
