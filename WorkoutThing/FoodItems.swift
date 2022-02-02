import Foundation
class FoodItems : Codable{
    var food : String
    var cals : Int
    init(food: String, cals: Int) {
        self.food = food
        self.cals = cals
    }
}
