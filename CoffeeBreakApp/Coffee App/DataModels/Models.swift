import Foundation

 class userDrinkInfo{
     var drinkName: String
     var temp: String
     var bean: String
     var roast: String
     var sugar: String
     var milkType: String
     var milkFat: String
     var flavor: String
     
     init() {
         self.drinkName = "Drink Name"
         self.temp = "temperature"
         self.bean = "Bean Type"
         self.roast = "Roast Level"
         self.sugar = "Sugar Level"
         self.milkType = "Milk Type"
         self.milkFat = "Mlk Fat"
         self.flavor = "flavor"
     }
     init(drinkName: String, beanType:String, roastLevel:String, sugarLevel:String, milkType:String, milkFat:String, flavor:String, temp:String  ) {
         self.drinkName = drinkName
         self.temp = temp
         self.bean = beanType
         self.roast = roastLevel
         self.sugar = sugarLevel
         self.milkType = milkType
         self.milkFat = milkFat
         self.flavor = flavor
     }
 }
 class friendUserDrinkInfo{
     var drinkName: String
     var temp: String
     var beanType: String
     var roastLevel: String
     var sugarLevel: String
     var milkType: String
     var milkFat: String
     var flavor: String
     init() {
         self.drinkName = "Drink Name"
         self.temp = "Temperature"
         self.beanType = "Bean Type"
         self.roastLevel = "Roast Level"
         self.sugarLevel = "Sugar Level"
         self.milkType = "Milk Type"
         self.milkFat = "Mlk Fat"
         self.flavor = "flavor"
     }
     init(drinkName: String, temp:String, beanType: String, roastLevel: String, sugarLevel: String, milkType:String, milkFat:String, flavor:String) {
         self.drinkName = drinkName
         self.temp = temp
         self.beanType = beanType
         self.roastLevel = roastLevel
         self.sugarLevel = sugarLevel
         self.milkType = milkType
         self.milkFat = milkFat
         self.flavor = flavor
 
     }
 }


class FriendInfo: Identifiable {
    let id = UUID()
    var name: String
    var AboutMe: String
    var DrinkList: String
    
    init(name: String, AboutMe: String, DrinkList: String) {
        self.name = name
        self.AboutMe = AboutMe
        self.DrinkList = DrinkList
    }
    
}
