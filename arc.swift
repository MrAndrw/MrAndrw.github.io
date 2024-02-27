// Описать несколько структур – любой легковой автомобиль и любой грузовик. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника
// ▸ Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема
// ▸ Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия
// ▸ Инициализировать несколько экземпляров структур. Применить к ним различные действия. Положить объекты структур в словарь как ключи, а их названия как строки например var dict = [structCar: 'structCar']
struct myCar: Hashable {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineIsRunning: Bool
    var windowsAreOpen: Bool
    var filledTrunkVolume: Double
    
    mutating func performAction(action: CarAction) {
        switch action {
        case .startEngine:
            engineIsRunning = true
        case .stopEngine:
            engineIsRunning = false
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false
        case .loadCargo(let cargoVolume):
            filledTrunkVolume += cargoVolume
        case .unloadCargo(let cargoVolume):
            filledTrunkVolume -= cargoVolume
        }
    }
}

struct Truck: Hashable {
    var brand: String
    var year: Int
    var bodyVolume: Double
    var engineIsRunning: Bool
    var windowsAreOpen: Bool
    var filledBodyVolume: Double
    
    mutating func performAction(action: TruckAction) {
        switch action {
        case .startEngine:
            engineIsRunning = true
        case .stopEngine:
            engineIsRunning = false
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false
        case .loadCargo(let cargoVolume):
            filledBodyVolume += cargoVolume
        case .unloadCargo(let cargoVolume):
            filledBodyVolume -= cargoVolume
        }
    }
}

enum CarAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(Double)
    case unloadCargo(Double)
}

enum TruckAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(Double)
    case unloadCargo(Double)
}

var car1 = myCar(brand: "Toyota", year: 2015, trunkVolume: 400.0, engineIsRunning: false, windowsAreOpen: false, filledTrunkVolume: 0.0)
var truck1 = Truck(brand: "Mercedes", year: 2018, bodyVolume: 2000.0, engineIsRunning: false, windowsAreOpen: false, filledBodyVolume: 0.0)

car1.performAction(action: .startEngine)
car1.performAction(action: .openWindows)
car1.performAction(action: .loadCargo(100.0))

truck1.performAction(action: .startEngine)
truck1.performAction(action: .loadCargo(500.0))

var dict: [AnyHashable: String] = [car1: "car1", truck1: "truck1"]

print()
// Capture List
// слабые, сильные и несобственные ссылки захвата. ( по дефолту свифт использует сильный захват)
// суть в том, что сильные ссылки не могут обратить запрашиваемые параметры в nill, они захватывают внешние параметры и держат
// их в себе даже после отработки функции. слабые ссылки не могут удерживать параметры замыкания и поэтому их можно обратить в nil
// несобственные ссылки являются альтернативй слабых ссылок. При неосторожном использовании параметры могут обратиться в nil и в результате
// программы возникнет фатальная ошибка
// пример:
class Dog {
    var breed: String
    init(breed: String) {
        self.breed = breed
    }
    deinit {
        print("The \(breed) has been deallocated")
    }
}

var dog1: Dog? = Dog(breed: "Shpits")
let strong_dog = dog1
dog1 = nil
print(strong_dog?.breed) // Выведет: Shpits и покажет, что это оптимал 
print()
var dog2: Dog? = Dog(breed: "Taksa")
weak var weak_dog = dog2
dog2 = nil
print(weak_dog) // Выведет: nil
print()
var dog3: Dog? = Dog(breed: "Labrador")
unowned let unowned_dog = dog3!
dog3 = nil
//print(unowned_dog.breed) // Выведет фатальную ошибку
print()

// код со скриншота, Рещение: необходимо задать переменную driver с weak для слабого удержания, чтобы он мог перейти в nil
//import UIKit
class Car {
    weak var driver: Man?
    deinit {
        print("машина удалена из памяти")
    }
}
class Man {
    var myCar: Car?
    deinit{
        print("мужчина удален из памяти")
    }
}
// объявим опциональные переменные, чтоб можно было присвоить nil
var car: Car? = Car()
var man: Man? = Man()
// машина теперь имеет ссылку на мужчину
car?.driver = man
// а мужчина на машину
man?.myCar = car
// присвоим nil пременным, удалим эти ссылки
car = nil
man = nil
// мы больше не можем никак обратиться к нашим объектам, но они продолжают существовать в памяти

print()
//проблема с паспортом (Man -> myMan и man -> myman чтоб программа выполнялась корректно) 
// Решение: заменить strong reference на unowned, так как паспорт всегда должен иметь владельца
class myMan {
    var pasport: Passport? // нельзя сюда ставить weak или unknow
    deinit {
        print("мужчина удален из памяти")
    }
}
class Passport {
    unowned let myman: myMan // заменим strong reference на unowned, так как паспорт всегда должен иметь владельца
    init(myman: myMan) {
        self.myman = myman
    }
    deinit {
        print("паспорт удален из памяти")
    }
}
var myman: myMan? = myMan()
var passport: Passport? = Passport(myman: myman!)
myman?.pasport = passport
passport = nil // объект еще не удален, его удерживает мужчина
myman = nil // теперь удалены оба объекта