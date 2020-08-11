//: [⇐ Previous: 03 - Challenge - Inheritance](@previous)
//: ## Episode 04: Initializers

/*
 // Base Class
 class Person {
 var firstName: String
 var lastName: String
 
 // designated initializers
 init(firstName: String, lastName: String) {
 self.firstName = firstName
 self.lastName = lastName
 }
 }
 
 // subclass of person (person is superclass)
 class Student: Person {
 var grades: [String] = []
 }
 
 
 // subclass of student (student is superclass)
 class StudentAthlete: Student {
 var sports: [String]
 /*
 // Phase 1 - you have to initialize all properties of current and all superclass hierarchy.
 init(firstName: String, lastName: String, sports: [String]) {
 self.sports = sports
 super.init(firstName: firstName, lastName: lastName)
 }
 }
 
 StudentAthlete(firstName: "Daniel", lastName: "Ruettiger", sports: ["Foosball"])
 StudentAthlete(firstName: "Daniel", lastName: "Ruettiger") <== error
 */
 
 /*
 // Phase 1 - you have to initialize all properties of current and all superclass hierarchy.
 init(firstName: String, lastName: String, sports: [String] = []) {
 self.sports = sports
 super.init(firstName: firstName, lastName: lastName)
 }
 }
 
 StudentAthlete(firstName: "Bernie", lastName: "Kosar")
 */
 
 // Phase 1 - you have to initialize all properties of current and all superclass hierarchy.
 
 // designated initializers
 override init(firstName: String, lastName: String) {
 self.sports = []
 super.init(firstName: firstName, lastName: lastName)
 }
 
 // designated initializers
 init(firstName: String, lastName: String, sports: [String]) {
 self.sports = sports
 super.init(firstName: firstName, lastName: lastName)
 }
 }
 
 StudentAthlete(firstName: "Bernie", lastName: "Kosar")
 */

// #################################################################################

// Two designated initializers used
/*
 // Base Class
 class Person {
 var firstName: String
 var lastName: String
 
 // designated initializers
 required init(firstName: String, lastName: String) {
 self.firstName = firstName
 self.lastName = lastName
 }
 }
 
 // subclass of person (person is superclass)
 class Student: Person {
 var grades: [String] = []
 }
 
 // subclass of student (student is superclass)
 
 class StudentAthlete: Student {
 var sports: [String]
 
 // concept of overriding build into required that's why we can't use override.
 // designated initializers
 required init(firstName: String, lastName: String) {
 self.sports = []
 super.init(firstName: firstName, lastName: lastName)
 }
 
 // ==> No
 /*
 required init(firstName: String, lastName: String, sports: [String]) {
 self.sports = []
 super.init(firstName: firstName, lastName: lastName)
 }
 */
 // <==
 
 // designated initializers
 init(firstName: String, lastName: String, sports: [String]) {
 self.sports = sports
 super.init(firstName: firstName, lastName: lastName)
 }
 }
 
 StudentAthlete(firstName: "Bernie", lastName: "Kosar")
 */

// #################################################################################
// One designated and one convenience initializer and we are able to use self.init inside convenience init.

/*
 // Base Class
 class Person {
 var firstName: String
 var lastName: String
 
 // designated initializers
 required init(firstName: String, lastName: String) {
 self.firstName = firstName
 self.lastName = lastName
 }
 }
 
 // subclass of person (person is superclass)
 class Student: Person {
 var grades: [String] = []
 }
 
 // subclass of student (student is superclass)
 
 class StudentAthlete: Student {
 var sports: [String]
 
 // concept of overriding build into required that's why we can't use override.
 // designated initializers
 convenience required init(firstName: String, lastName: String) {
 self.init(firstName: firstName, lastName: lastName, sports: [])
 }
 
 // ==> No
 /*
 required init(firstName: String, lastName: String, sports: [String]) {
 self.sports = []
 super.init(firstName: firstName, lastName: lastName)
 }
 */
 // <==
 
 // designated initializers
 init(firstName: String, lastName: String, sports: [String]) {
 self.sports = sports
 super.init(firstName: firstName, lastName: lastName)
 }
 }
 
 StudentAthlete(firstName: "Bernie", lastName: "Kosar")
 */

// #################################################################################
// Exploring convenience initializer


// Base Class
class Person {
    var firstName: String
    var lastName: String
    
    // designated initializers
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// subclass of person (person is superclass)
class Student: Person {
    var grades: [String] = []
    
    // ==>
    convenience init(transfer: Student) {
        //        grades = transfer.grades // <== not possible because phase 1 is not completed
        self.init(firstName: transfer.firstName, lastName: transfer.lastName)
        grades = transfer.grades  // <== possible because after phase 1 we can use self and variable propeties can be mutated.
    }
    // <==
}

// subclass of student (student is superclass)

class StudentAthlete: Student {
    var sports: [String]
    
    // concept of overriding build into required that's why we can't use override.
    // designated initializers
    required convenience init(firstName: String, lastName: String) {
        self.init(firstName: firstName, lastName: lastName, sports: [])
    }
    
    convenience init(transfer: StudentAthlete) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName, sports: transfer.sports)
        grades = transfer.grades
    }
    
    
    // ==> No
    /*
     required init(firstName: String, lastName: String, sports: [String]) {
     self.sports = []
     super.init(firstName: firstName, lastName: lastName)
     }
     */
    // <==
    
    // designated initializers
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
    }
}


let rudy = StudentAthlete(firstName: "Daniel", lastName: "Ruettiger", sports: ["Foosball"])
StudentAthlete(firstName: "Bernie", lastName: "Kosar")

StudentAthlete(transfer: rudy).sports // <== sports won't transfer

// added code at 210 - convenience init. now sports will transfer
StudentAthlete(transfer: rudy).sports

// you can try by changing transfer -> transfers.
//: [Episode 05: Challenge: Initializers](@next)
