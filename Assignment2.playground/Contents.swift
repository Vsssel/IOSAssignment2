
// task 1
class Student {
    var name: String
    var age: Int
    var grades: [Int]
    
    // calculating avg grade
    
    var averageGrade: Double {
        return grades.isEmpty ? 0 : Double(grades.reduce(0, +)) / Double(grades.count)
    }
    
    // writing description
    
    var description: String {
        return "Name: \(name) Avg garde: \(averageGrade) Status: \(getStatus())"
    }
    
    // Initializer
    init(name: String, age: Int, grades: [Int] = []) {
        self.name = name
        self.age = age
        self.grades = grades
    }
    
    // getting status depending of the abg grade
    
    func getStatus() -> String {
        if averageGrade == 0 {
            return "New"
        }
        else if averageGrade >= 1 && averageGrade < 4 {
            return "Underperforming"
        }
        else if averageGrade >= 4 && averageGrade < 7 {
            return "Average"
        }
        else if averageGrade >= 7 && averageGrade < 9 {
            return "Good"
        }
        else if averageGrade >= 9 && averageGrade <= 10 {
            return "Excelent"
        }
        return ""
                    
    }
    
    // adding grade
    
    func addGrade(_ grade: Int) {
        grades.append(grade)
    }
}


let student1 = Student(name: "Assel", age: 19, grades: [5, 9])
student1.addGrade(8)
student1.addGrade(10)
print(student1.description)

let student2 = Student(name: "Medat", age: 20, grades: [10, 6])
student2.addGrade(9)
student2.addGrade(8)
print(student2.description)



// task 2

class Employee {
    var name: String
    var surname: String
    var salary: Int
    
    init(name: String, surname: String, salary: Int) {
        self.name = name
        self.surname = surname
        self.salary = salary
    }
}

let names = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jenkins"]

var employees: [Employee] = []

for num in 1...10 {
    employees.append(Employee(name: names.randomElement() ?? "", surname: surnames.randomElement() ?? "", salary: Int.random(in: 1000...2000)))
}

for employee in employees {
    print("\(employee.name) \(employee.surname)'s salary is \(employee.salary)")
}

print("Even salaries:")
for employee in employees {
    if employee.salary % 2 == 0 {
        print("\(employee.name) \(employee.surname)'s salary is \(employee.salary)")
    }
}


// task 3

class Shape {
    
    var area: Double {
        return 0
    }
    
    var perimeter: Double {
        return 0
    }
    
    var description: String {
        return "The area is \(area). Perimeter is \(perimeter)"
    }
}

class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    override var area: Double{
        return Double.pi * radius * radius
    }
    
    override var perimeter: Double{
        return 2 * Double.pi * radius
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    override var area: Double{
        return width * height
    }
    
    override var perimeter: Double{
        return (width + height) * 2
    }
    
}


class Ellipse: Rectangle {
    override var area: Double {
        return Double.pi * (width / 2) * (height / 2)
    }
    
    override var perimeter: Double {
        return Double.pi * (3 * (width + height) - Double.squareRoot((3 * width + height) * (width + 3 * height))())
    }
}


let circle = Circle(radius: 5)
print(circle.description)

let rectangle = Rectangle(width: 10, height: 20)
print(rectangle.description)

let ellipse = Ellipse(width: 15, height: 25)
print(ellipse.description)



// task 4

struct Car {
    var model: String
    var power: Int
    
    var description: String {
        return "The car model \(model) has \(power) horsepower."
    }
    
    mutating func increasePower(by amount: Int) {
        power += amount
    }
}

var myCar = Car(model: "Toyota", power: 150)
print(myCar.description)

myCar.increasePower(by: 50)
print(myCar.description)



// task 5

enum CalculationType {
    case addition, subtraction, multiplication, division
}

func calculate(_ num1: Int, _ num2: Int, _ operation: CalculationType) -> Int {
    var result: Int
    switch operation {
    case .addition:
        result = num1 + num2
        print("The result of addition of \(num1) and \(num2) is \(result)")
    case .subtraction:
        result = num1 - num2
        print("The result of subtraction of \(num1) and \(num2) is \(result)")
    case .multiplication:
        result = num1 * num2
        print("The result of multiplication of \(num1) and \(num2) is \(result)")
    case .division:
        result = num1 / num2
        print("The result of division of \(num1) and \(num2) is \(result)")
    }
    return result
}

calculate(10, 5, .addition)
calculate(10, 5, .subtraction)
calculate(10, 5, .multiplication)
calculate(10, 5, .division)


// task 6

enum DistanceUnit {
    case versta(title: String, denotation: String, countries: [String])
    case kilometer(title: String, denotation: String, countries: [String])
    case mile(title: String, denotation: String, countries: [NonISUCountry])
    
    enum NonISUCountry: String {
        case USA, Liberia ,Myanmar
    }
}

func printDistanceUnit(_ unit: DistanceUnit) {
    switch unit {
    case let .versta(title, denotation, countries):
        print("\(title). Abbreviation: \(denotation). Countries: \(countries.joined(separator: ", ")).")
    case let .kilometer(title, denotation, countries):
        print("\(title). Abbreviation: \(denotation). Countries: \(countries.joined(separator: ", ")).")
    case let .mile(title, denotation, countries):
        print("\(title). Abbreviation: \(denotation). Countries: \(countries.map { $0.rawValue }.joined(separator: ", ")).")
    }
}


let versta = DistanceUnit.versta(title: "Versta", denotation: "verst", countries: ["Russia"])
let kilometer = DistanceUnit.kilometer(title: "Kilometer", denotation: "km", countries: ["Russia", "European Union"])
let mile = DistanceUnit.mile(title: "Mile", denotation: "mi", countries: [.USA, .Liberia, .Myanmar])

printDistanceUnit(versta)
printDistanceUnit(kilometer)
printDistanceUnit(mile)
