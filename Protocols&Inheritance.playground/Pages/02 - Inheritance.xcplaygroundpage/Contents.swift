//: ## Episode 02: Inheritance

// Polymorphism - A subclass can be treated as its own type or as any of its superclasses.

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

// Base Class
class Person {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

/*
 class Student {
   var grades: [Grade] = []
   
   var firstName: String
   var lastName: String
   
   init(firstName: String, lastName: String) {
     self.firstName = firstName
     self.lastName = lastName
   }
 }
 */

// subClass of Person
class Student: Person {
  var grades: [Grade] = []
}

let jon = Person(firstName: "Jon", lastName: "Snon")
let jane = Student(firstName: "jane", lastName: "Snane")
jon.firstName
jane.firstName

let historyGrade = Grade(letter: "B", points: 9, credits: 3)
jane.grades.append(historyGrade)

// jon.grades // <== error

//: ## student is subclass of person and person is superclass.
//: ## a subclass can't inherit from two superclass.
//: ## a subclass can inherit only from one superclass.

// subClass of Student
class SchoolBandMember: Student {
    var minimumPracticeTime = 2
}

// subClass of Student

/*
 class StudentAthlete: Student {
     var isEligible: Bool {
         return grades.filter { $0.letter == "F" }.count < 3
     }
 }

 */

// ==> Last implementation
/*
 class StudentAthlete: Student {
     override var grades: [Grade] {
         get { super.grades }
         set {
             super.grades = newValue
             if !isEligible {
                 print("It's time to study!")
             }
         }
     }
     var isEligible: Bool {
         return grades.filter { $0.letter == "F" }.count < 3
     }
 }
 */

class StudentAthlete: Student {
    override var grades: [Grade] {
        didSet {
            if !isEligible {
                print("It's time to study!")
            }
        }
    }
    var isEligible: Bool {
        return grades.filter { $0.letter == "F" }.count < 3
    }
}

let utterFailureGrade = Grade(letter: "F", points: 0, credits: 0)
let himanshu  = StudentAthlete(firstName: "Himanshu", lastName: "Rajput")
himanshu.grades.append(utterFailureGrade)
himanshu.grades.append(utterFailureGrade)
himanshu.grades.append(utterFailureGrade)


// <==

let jesse = SchoolBandMember(firstName: "jesse", lastName: "Catterwaul")
let marty = StudentAthlete(firstName: "Marty", lastName: "McWolf")

// Polymorphism
//let array = [jon, jane, jesse, marty] // [Person]

//let array: [Student] = [jon, jane, jesse, marty] // <== error - jon is not student.

let array = [jane, jesse, marty] // [Student]

// Type casting

// Upcasting - you can cast from subclass to superclass
let student = marty as Student

// downcasting - you can cast from superclass to subclass

// forced downcasting - Do it when you are 100% sure

let athlete = student as! StudentAthlete

//let athlete = student as! SchoolBandMember // <== it will crash becasue marty was not an StudentAthlete

func getEveningActivity(student: Student) -> String {
    if let bandMember = student as? SchoolBandMember {
        return "Practicing for at least \(bandMember.minimumPracticeTime)"
    } else {
        return "Hitting the books!"
    }
}

getEveningActivity(student: jesse)
getEveningActivity(student: jane)
getEveningActivity(student: marty)


//: [Episode 03: Challenge - Inheritance](@next)
