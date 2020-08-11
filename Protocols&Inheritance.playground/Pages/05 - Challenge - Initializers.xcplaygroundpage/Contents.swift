//: [⇐ Previous: 04 - Initializers](@previous)
//: ## Episode 05: Challenge: Initializers

/*:
 ## Challenge 1 😃
 Create a class named `Animal` that has…
 1. a single stored property named `name`, that is a `String`
 2. a required initializer that takes `name` as a parameter
 3.  a function `speak()` that does nothing.
 */

class Animal {
    let name: String
    
    required init(name: String) {
        self.name = name
    }
    
    func speak() {
        
    }
}

/*:
 Create a class named `Dog` that…
 1. inherits from `Animal`
 2. has a property that stores how many tricks it has learned
 3. implements the required initializer, defaulting the trick count to `0`, and calling `speak()` at the end
 4. overrides the function `speak()` to greet you and says its name
 */

// TODO: Write solution here

class Dog: Animal {
    var tricks: UInt
    
    init(name: String, tricks: UInt) {
        self.tricks = tricks
        super.init(name: name)
        speak()
    }
    
    convenience required init (name: String) {
        self.init(name: name, tricks: 0)
    }
    
    convenience init(numTricksLearned: UInt = .max) {
        self.init(name: "Bruno", tricks: numTricksLearned)
    }
    
    override func speak() {
        print("my name is \(name)")
    }
}

Dog(name: "Koko")
Dog(name: "Tintin", tricks: 10)
Dog()
//Dog(name: "Tintin", numTricksLearned: 10)

/*:
 Add a second (non-required) initializer to `Dog` that takes both the `name` and `numTricksLearned` as parameters. Then call this initializer from the required initializer.
 */

/*:
 Add a convenience initializer to `Dog` that defaults the dog's name to your favorite dog's name, with however many tricks the dog has learned.
 */

//: [Episode 06: Protocols](@next)
