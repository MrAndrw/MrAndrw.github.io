import Foundation
// создать класс родитель и два класса наследника
class Car {
    var type: String
    init(type:String){
        self.type = type
    }
}
class SportCar: Car {
    var maxspeed: Int
    var model: String
    init(maxspeed:Int, model:String, type: String){
        self.maxspeed = maxspeed
        self.model = model
        super.init(type: type)
    }
}
class FamiliCar: Car {
    var countSeats: Int
    var model: String
    init(countSeats:Int, model: String, type: String){
        self.countSeats = countSeats
        self.model = model
        super.init(type: type)
    }
}
let car1 = Car(type:"Sport")
let car2 = Car(type:"Family")
let sportcar1 = SportCar(maxspeed:300, model:"Audi R8", type: car1.type)
let familycar1 = FamiliCar(countSeats: 9, model: "Ford", type: car2.type)
print(car1.type)
print(car2.type)
print(sportcar1.maxspeed, sportcar1.model, sportcar1.type)
print(familycar1.countSeats, familycar1.model, familycar1.type)
print()
// класс дом и его методы
class House{
    let width = 100
    let height = 100
    func create() -> String {
        return ("square of the House is \(width * height)")
    }
    func destroy() -> String {
        return ("house has been destroed")
    }
}
let c = House()

print(c.create())
print(c.destroy())
print()

class Student {
    var name: String
    var age: Int
    var grade: Int
    init(name: String, age: Int, grade: Int) {
        self.name = name
        self.age = age
        self.grade = grade
    }
}

class Sorter {
    func SortNames(students: [Student]) -> [Student] {
        return students.sorted { $0.name < $1.name }
    }  
    func SortAges(students: [Student]) -> [Student] {
        return students.sorted { $0.age < $1.age }
    }
    func SortGrades(students: [Student]) -> [Student] {
        return students.sorted { $0.grade > $1.grade }
    }
}

let student1 = Student(name: "Bob", age: 18, grade: 5)
let student2 = Student(name: "Tom", age: 20, grade: 3)
let student3 = Student(name: "Kate", age: 19, grade: 4)

let students = [student1, student2, student3]

let sorter = Sorter()
let sortname = sorter.SortNames(students: students)
let sortage = sorter.SortAges(students: students)
let sortgrade = sorter.SortGrades(students: students)


print("Sorted by names:")
for i in 0...2 {
print(sortname[i].name, sortname[i].age, sortname[i].grade)
}
print()
print("Sorted by age:")
for i in 0...2 {
print(sortage[i].name, sortage[i].age,sortage[i].grade)
}
print()
print("Sorted by grade:")
for i in 0...2 {
print(sortgrade[i].name, sortgrade[i].age, sortgrade[i].grade)
}

//создание структуры и класса

class CatClass {
    var age: Int
    var weight: Int
    var name: String
    var type: String
    init(name:String, age:Int, type: String, weight: Int){
        self.age = age
        self.name = name
        self.type = type
        self.weight = weight
    }
}
let cat1 = CatClass(name:"Marfa", age: 6, type: "European", weight: 7)
struct CatStruct {
    var name: String
    var age: Int
    var type: String
    var weight: Int
}
let cat2 = CatStruct(name:"Pushok",age:5,type:"Sfinks",weight: 4)

// Первое отличие структуры от класса в том, что для нее swift уже создает конструктор по умолчанию, его
// не нужно создавать вручную.
// Также, если значения полей класса устанавливаются с let, то изменить значение можно
// только в конструкторе, а если значение задается как var, то его можно менять после создания экземпляра класса,
// в структуре, если значение свойства устанавливается с let, то его уже не поменять после создания экземпляра структуры, также
// при создании экземпляра с let. Для изменения значения полей экземпляра структуры, необходимо, чтобы устанавливались с
// var как поля самой структуры, так и ее экземпляр
// еще важное отличие в том, что структура имеет тип Value, что дает возможность копировать ее экземпляры в другие,
// а класс имеет тип Reference на основе ссылок и указателей, поэтому один экземпляр класса может изменяться через другой
// структуры лучше создавать для небольшого количества свойств, а классы помогают быстрее работать с большими данными 


// выбрать комбинацию из 5 карт в покере, сохранить ее в массив и вывести (У вас бубновый стрит флеш)
// Генерация рандомных карт
func generateRandomCards() -> [String] {
    let suits = ["Пики", "Крести", "Черви", "Бубны"]
    let values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Валет", "Дама", "Король", "Туз"]
    
    var cards = [String]()
    while cards.count <= 5 {
        let index_suit = Int.random(in: 0...3)
        let index_value = Int.random(in: 0...12)
        let randomSuit = suits[index_suit]
        let randomValue = values[index_value]
        let card = "\(randomValue) \(randomSuit)"
        if !cards.contains(card) {
            cards.append(card)
        }
    }
    
    return cards
}

// Проверка комбинаций
func checkPokerHand(cards: [String]) {
    let sortedValues = cards.map {
        $0.components(separatedBy: " ")[0]
    }.sorted()
    
    let suits = Set(cards.map {
        $0.components(separatedBy: " ")[1]
    })
    
    if suits.count == 1 {
        if sortedValues == ["10", "Валет", "Дама", "Король", "Туз"] {
            print("У вас роял флеш")
        } else {
            print("У вас \(suits.first!) флеш")
        }
    } else if sortedValues.contains("10") && sortedValues.contains("Валет") && sortedValues.contains("Дама") && sortedValues.contains("Король") && sortedValues.contains("Туз") {
        print("У вас стрит")

    }
     else {
        print("У вас обычная комбинация")
    }
}

let cards = generateRandomCards()
print("Ваши карты: \(cards)")
checkPokerHand(cards: cards)
 