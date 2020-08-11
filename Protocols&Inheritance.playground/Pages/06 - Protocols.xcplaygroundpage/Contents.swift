//: [⇐ Previous: 05 - Challenge: Initializers](@previous)
//: ## Episode 06: Protocols

protocol Animal {
    var name: String { get } // <== when you are making it get then it will come as let when we implement in any named type(class, struct, enum)
//    var name: String { get set } // <== when you are making it get and set then it will come as var when we implement in any named type
    
    init(name: String) // <== protocol init can't have body
    
    func speak() // <== protocol function can't have body
}


class Dog: Animal {
    let name: String // <== let, because name is defined as get type in protocol
    var tricksLearnedCount: Int
    
    init(name: String, tricksLearnedCount: Int) {
        self.name = name
        self.tricksLearnedCount = tricksLearnedCount
    }
    
    convenience required init(name: String) {
        self.init(name: name, tricksLearnedCount: 0)
    }
  
    func speak() {
    print("Bow wow! My name is \(name)!")
  }
}

class Cat: Animal {
    let name: String
    
    required init(name: String) {
        self.name = name
    }
    
   func speak() {
    print("My name is \(name). Please leave me alone. I must look at this wall.")
  }
}

let animals: [Animal] = [Dog(name: "Fang"), Cat(name: "Mr. Midnight")]  // <== explicit typing
for animal in animals {
  animal.speak()
}

//: [Episode 07: Protocols & Extensions](@next)
