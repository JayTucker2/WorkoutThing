import Foundation

class CalorieCounter{
    var tCals : String
    var food : [FoodItems]
    init(tCals : String, food : [FoodItems]) {
        self.tCals = tCals
        self.food = food
    }
}
