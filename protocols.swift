import Foundation
// создать структуру и реализовать CoW
func address(of object: UnsafeRawPointer) -> String {
    let addr = Int(bitPattern: object)
    return String(format: "%p", addr)
}
func address(off value: AnyObject) -> String {
    return "\(Unmanaged.passUnretained(value).toOpaque())"
}
struct IOSCollection {
    var id = 1
}
class Ref<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}
struct Container<T> {
    var ref: Ref<T>
    init(value: T) {
        self.ref = Ref(value: value)
    }
    var value: T {
        get {
            ref.value
        }
        set {
            guard (isKnownUniquelyReferenced(&ref)) else {
              ref = Ref(value: newValue)
              return
            }
            ref.value = newValue
        }
    }
}
var id = IOSCollection()
var container1 = Container(value: id)
var container2 = container1

print("Addresses: ")
print(address(off: container1.ref))
print(address(off: container2.ref))

container2.value.id = 12
print("new Addresses: ")
print(address(off: container1.ref))
print(address(off: container2.ref))

// протокол Hotel и класс HotelAlfa
print(" ")
protocol Hotel {
    init(roomCount: Int)
}
class HotelAlfa: Hotel {
    var roomCount: Int
    required init(roomCount: Int) {
        self.roomCount = roomCount
    }
}

// протокол GameDice
protocol GameDice {
    var numberDice: Int { get }
}
extension Int: GameDice {
    var numberDice: Int {
        print("Выпало \(self) на кубике")
        return self
    }
}

let diceCoub: Int = 4
diceCoub.numberDice


// создать протокол с двумя свойствами и одно свойство сделать optional
print(" ")
protocol Test {
  var requiredProperty: String { get }
  var optionalProperty: Int? { get }
  func someMethod()
}

class MyClass: Test {
  var requiredProperty: String = "Yes"
  var optionalProperty: Int?
  func someMethod() {
      print("No")
  }
}

let myObject = MyClass()
print(myObject.requiredProperty) 

// проработать код из видео
// print(" ")
// protocol Priority {
//   var order: Int {get}
// }
// protocol EntryName:Priority {
//   var label: String {get}
// }
// class Student: EntryName {
//   var firstname: String
//   var lastname: String
//   var fullname: String {
//     return firstname + " " + lastname
//   }
//   init(firstname: String, lastname: String){
//     self.firstname = firstname
//     self.lastname = lastname
//   }
//   var label: String {
//     return fullname
//   }
//   let order = 1
// }
// class Animal{

// }
// class Cow: Animal, EntryName {
//   var name: String?
//   var label: String {
//     return name ?? "a cow"
//   }
//   let order = 2
// }
// struct Grass: EntryName {
//   var type: String
//   var label: String {
//     return "Grass" + type
//   }
//   let order = 3
// }
// let student1 = Student(firstname: "Bob", lastname: "Shmob")
// let student2 = Student(firstname: "Bill", lastname: "Shmill")
// let student3 = Student(firstname: "Brian", lastname: "Shmian")
// let cow1 = Cow()
// cow1.name = "Burenka"
// let cow2 = Cow()
// let grass1 = Grass(type: "Bermuda")
// let grass2 = Grass(type: "St. Augustine")


// // for value in array {
// //   switch value {
// //     case let grass as Grass: println(grass.type)
// //     case let student as Student: println(student.fullname)
// //     case let cow as Cow: println(cow.name ?? "a cow")
// //     default: break
// //   }
// // }
// func printFarm(var array: [EntryName]) {
//   let a = "a"
//   a.lovercaseString
//   array.sort({a, b in
//     if a.order == b.order {
//         return a.label.lovercaseString  < b.label.lovercaseString
//     } else {
//         return a.order < b.order
//     }
//   })
//   for value in array {
//     print(value.label)
//   }
// }
// var array: [EntryName] = [cow1, student1, grass2, cow2, student3, grass1, student2]
// // for value in array {
// //     print(value.label)
// //   }
// printFarm(array)

// два протокола, свойства и время, класс компания
print(" ")
protocol Coding {
  var time: Int { get }
  var codeCount: Int { get }
  func writeCode(platform: Platform, numberOfSpecialist: Int)
}
protocol Work {
  func stopCoding()
}

enum Platform {
  case ios
  case android
  case web
}

class Company: Coding, Work {
  var numberOfProgrammers: Int
  var specializations: [Platform]
  var time: Int = 0
  var codeCount: Int = 0

  init(numberOfProgrammers: Int, specializations: [Platform]) {
      self.numberOfProgrammers = numberOfProgrammers
      self.specializations = specializations
  }

  func writeCode(platform: Platform, numberOfSpecialist: Int) {
      self.time += 1
      self.codeCount += numberOfSpecialist
      
      var platformsString = ""
      for specialization in specializations {
          platformsString += specialization.description + ", "
      }   
      print("Разработка началась. Пишем код для платформ \(platformsString)")
  }

  func stopCoding() {
      print("Работа закончена. Сдаю в тестирование")
  }
}
extension Platform: CustomStringConvertible {
  var description: String {
    switch self {
      case .ios:
        return "iOS"
      case .android:
        return "Android"
      case .web:
        return "Web"
    }
  }
}

// Пример использования

let company = Company(numberOfProgrammers: 5, specializations: [.ios, .android])

company.writeCode(platform: .ios, numberOfSpecialist: 3)
company.writeCode(platform: .android, numberOfSpecialist: 2)
company.stopCoding()