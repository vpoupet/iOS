
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
    
    func greet() {
        print("Hello, \(name)!")
    }
    
    func increaseAge(_ years: Int) {
        age += years
    }
    
    func ageDifferenceWith(otherPerson: Person) -> Int {
        return age - otherPerson.age
    }
    
    deinit {
        print("Deleted the person named \(name)")
    }
}

let bob = Person(name: "Bob", age: 25)
let susan = Person(name: "Susan", age: 22)
let baby = Person(name: "James")

bob.age
bob.greet()
bob.increaseAge(10)
bob.ageDifferenceWith(otherPerson: susan)
susan.ageDifferenceWith(otherPerson: baby)

class Student: Person {
    var school: String?
    
    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    
    override init(name: String, age: Int) {
        super.init(name: name, age: age)
    }
	
    override func greet() {
        print("Hello, student \(name)")
    }
    
    func sameSchoolAs(otherStudent: Student) -> Bool? {
        if school != nil && otherStudent.school != nil {
            return school! == otherStudent.school!
        }
        return nil
    }
}

let mike = Student(name: "Mike", age: 20, school: "Megacity University")
var paul = Student(name: "Paul", age: 18, school: "Smalltown University")
var steve = Student(name: "Steve", age: 18)

mike.sameSchoolAs(otherStudent: paul)
mike.sameSchoolAs(otherStudent: steve)
mike.ageDifferenceWith(otherPerson: bob)
mike.greet()

let johnathan = paul
johnathan.age += 10
paul.age
var x = 10
var y = x
y += 10
x

