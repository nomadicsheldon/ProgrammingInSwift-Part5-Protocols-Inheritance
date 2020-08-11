//: [⇐ Previous: 06 - Protocols](@previous)
//: ## Episode 07: Protocols & Extensions

protocol Animal {
  var name: String { get }

  init(name: String)

  func speak()
}

protocol Aloof {
    var name: String { get }
}

extension Aloof {
    var greeting: String {
        "My name is \(name). Please leave me alone."
    }
}

// inherits from Animal and Aloof
protocol AloofAnimal: Aloof, Animal {  }

// creating extension for default implementation for speak
extension AloofAnimal {
    func speak() {
      print("\(greeting) I must look at this wall.")
    }
}


class Dog: Animal {
  let name: String
  var tricksLearnedCount: Int
  
  init(name: String, tricksLearnedCount: Int) {
    self.tricksLearnedCount = tricksLearnedCount
    self.name = name
  }
  
  convenience required init(name: String) {
    self.init(name: name, tricksLearnedCount: 0)
  }
  
  func speak() {
    print("Bow wow! My name is \(name)!")
  }
}

class Cat {
  let name: String
  
  required init(name: String) {
    self.name = name
  }
}

extension Cat: AloofAnimal {
    func speak() {
        print(greeting + "Meow!")
    }
}

let animals: [Animal] = [Dog(name: "Fang"), Cat(name: "Mr. Midnight")]
for animal in animals {
  animal.speak()
}


/*
 LIMITATION FOR EXTENSIONS
 
 ❌ No Stored instance Properties
 ❌ No Required or Designated initializers
 ✅ Methods
 ✅ Computed Properties & Stored Type Properties
 ✅ Convenience Initializers
 
 */

//: Extensions!

// --------------------------------
func isEven(_ value: Int) -> Bool {
  value % 2 == 0
}
func isOdd(_ value: Int) -> Bool {
  (value + 1) % 2 == 0
}
// --------------------------------

extension Int {
    var isEven: Bool {
      self % 2 == 0
    }
    var isOdd: Bool {
      (self + 1) % 2 == 0
    }
}

5.isEven
5.isOdd

extension Numeric {
    var squared: Self { self * self }  // <== Self - with Self we are saying that squared is the same type whatever type the instance will be
}

45.squared
45.3.squared


//: More Extensions!

// --------------------------------
enum Weekday: CaseIterable {
  case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

struct Time {
  var day: Weekday = .monday
  var hour: UInt = 0
    /*
     init(day: Weekday) {
         self.day = day
     }
     */

}

extension Time {
    init(day: Weekday) {
        self.day = day
    }
}

// --------------------------------
Time()
Time(day: .friday)
Time(day: .monday, hour: 23)



/*
 EXTENSION SUPER POWERS
➡️ Add functionality to Swift types
➡️ Add protocol conformance to existing types!
➡️ Add default implementations to protocols
➡️ Organize code
➡️ Use a Structure's memberwise initializer and write your own
 
 */

//: [Episode 08: Challenge - Protocols](@next)
