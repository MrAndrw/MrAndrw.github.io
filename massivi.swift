// год будет 2024, в феврале 29 дней
// массив дней в месяцах
let days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
// массив месяцев
let months = ["January","February","March","April","May","June","July","August","September","October","November","December",]
// вывод дней месяцев
for i in days {
    print(i)
}

print()
// вывод дней месяцев и их название
for i in 0...11 {
    print(months[i], "has", days[i], "days")
}

print()
// вывод с помощью tuples
let tuples = (months, days)
for i in 0...11{
    print(tuples.0[i], "has", tuples.1[i], "days")
}

print()
// вывод в обратном порядке
var j = 11
for i in 0...11{
    print(tuples.0[j], "has", tuples.1[j], "days")
    j -= 1
}

print()
//подсчет количества дней до даты 21 февраля (52 дня)
let need_date = 21
let need_month = "February"
var summ_days = 0
var t = 0
for i in months{
    if i == need_month{
        summ_days += need_date
        print(summ_days, "days left to needed date")
        break
    }
    else {
        summ_days += days[t]
        t += 1
    }
}
