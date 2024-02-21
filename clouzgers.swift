// Сортировка массива в одну сторону
let numbers = [5, 2, 8, 1, 9]
let sortedNumbersForward = numbers.sorted { $0 < $1 }
print("Sorted mass in one side: \(sortedNumbersForward)")

print()
// Сортировка массива в обратную сторону
let sortedNumbersBackward = numbers.sorted { $0 > $1 }
print("Sorted mass in else side: \(sortedNumbersBackward)")

print()
// Метод для добавления имен друзей и сортировки по количеству букв
func sortFriendsByLength(names: String...) -> [String] {
    var friendsArray = names
    friendsArray.sort { $0.count < $1.count }
    return friendsArray
}

let sortedFriends = sortFriendsByLength(names: "Kate", "Andrew", "Den", "Sheldon")
print("Sorted friends by count letter: \(sortedFriends)")

print()
// Создание словаря с количеством символов в имени в качестве ключа
var Vocabulary = [Int: String]()

for friend in sortedFriends {
    Vocabulary[friend.count] = friend
}

print("Vocabulary with count letters:")
for (len, name) in Vocabulary {
    print("Letters: \(len), Name: \(name)")
}

print()
// Функция для вывода значения по ключу из словаря
func printFriendName(for len: Int, from dictionary: [Int: String]) {
    if let friendName = dictionary[len] {
        print("letters = \(len): \(friendName)")
    } else {
        print("No found.")
    }
}
let need_len = 4
printFriendName(for: need_len, from: Vocabulary)

print()
// Функция для проверки и вывода двух массивов
func checkArraysAndPrint(stringArray: [String], intArray: [Int]) {
    if stringArray.isEmpty {
        print("string mass is empty")
        // Добавим любое значение в строковый массив
        let defaultString = "Default"
        print("value '\(defaultString)' entered in mass")
        print("string mass: \(stringArray + [defaultString])")
    }

    if intArray.isEmpty {
        print("int mass is empty")
        // Добавим любое значение в числовой массив
        let defaultInt = 0
        print("value '\(defaultInt)' entered in mass")
        print("int mass: \(intArray + [defaultInt])")
    }
}

let emptyStringArray: [String] = []
let nonEmptyIntArray = [1, 2, 3]
checkArraysAndPrint(stringArray: emptyStringArray, intArray: nonEmptyIntArray)
