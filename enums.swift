// 2 enum с разным типом rowvalue
enum Digits: Int {
    case one = 1
    case two = 2
    case three = 3
}
enum Letters: String {
    case a = "a"
    case b = "b"
}

// анкета сотрудника
enum Gender: String {
    case m = "Male"
    case g = "Female"
}
enum AgeCategory {
    case student
    case adult
    case old
}
enum Stagg: Int {
    case WorkTime
}

// enum со всеми цветами радуги
enum Rainbow: String {
    case r = "Red"
    case o = "Orange"
    case y = "Yellow"
    case g = "Green"
    case b = "Blue"
    case d = "Dark Blue"
    case v = "Violet"
}

// функция, которая выводит разные кейсы
enum Things {
    case apple(String)
    case sun(String)
}

func printThingColor(thing: Things) {
    switch thing {
    case .apple(let color):
        print("apple \(color)")
    case .sun(let color):
        print("sun \(color)")
    }
}

let Thing1 = Things.apple("green")
printThingColor(thing: Thing1)

let Thing2 = Things.sun("red")
printThingColor(thing: Thing2)

print()
//функция, выставляющая оценки в школе
enum Score: String{
    case otl
    case hor
    case ydovl
    case neydovl
}
func printValScore(score: Score){
    switch score{
        case .otl:
            print(5)
        case .hor:
            print(4)
        case .ydovl:
            print(3)
        case .neydovl:
            print(2) 
    }
    
}

let score1 = Score.otl
let score2 = Score.hor
let score3 = Score.ydovl
let score4 = Score.neydovl
printValScore(score: score1)
printValScore(score: score2)
printValScore(score: score3)
printValScore(score: score4)

print()
// какие автомобили стоят в гараже
enum Car {
    case Audi
    case BMW
    case Ford
}
func printCars(garage: [Car]) {
    print("Cars in the garage:")
    
    for car in garage {
        switch car {
        case .Audi:
            print("Audi")
        case .BMW:
            print("BMW")
        case .Ford:
            print("Ford")
        }
    }
}
let myGarage: [Car] = [.Audi, .BMW, .Ford]
printCars(garage: myGarage)