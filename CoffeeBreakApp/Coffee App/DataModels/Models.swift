import Foundation
import SwiftUI

//Current User's object
class userDrinkInfo: ObservableObject, Equatable{
    static func == (lhs: userDrinkInfo, rhs: userDrinkInfo) -> Bool {
        return lhs.drinkName == rhs.drinkName
    }
    @Published var userName: String
    @Published var drinkName: String
    @Published var temp: String
    @Published var bean: String
    @Published var roast: String
    @Published var sugar: String
    @Published var milkType: String
    @Published var flavor: String
    //The Extra text files
    @Published var creamerLevel: String
    @Published var sugarBags: String
    @Published var texture: String
    @Published var level: String
    @Published var extraComments: String
     
     init() {
        
        self.userName = "Username"
        self.drinkName = "Drink Name"
        self.temp = "temperature"
        self.bean = "Bean Type"
        self.roast = "Roast Level"
        self.sugar = "Sugar Level"
        self.milkType = "Milk Type"
        self.flavor = "flavor"
        //The Extra text files
        self.creamerLevel = "Creamer Levels"
        self.sugarBags = "Bags of Sugar"
        self.texture = "Milk Texture"
        self.level = "Milk Level"
        self.extraComments = "Extra Comments"
        
     }
     init(userName: String, drinkName: String, bean:String, roast:String, sugar:String, milkType:String, flavor:String, temp:String, creamerLevel: String, sugarBags: String, texture: String, level: String, extraComments: String) {
        
        self.userName = userName
        self.drinkName = drinkName
        self.temp = temp
        self.bean = bean
        self.roast = roast
        self.sugar = sugar
        self.milkType = milkType
        self.flavor = flavor
        //The Extra text files
        self.creamerLevel = creamerLevel
        self.sugarBags = sugarBags
        self.texture = texture
        self.level = level
        self.extraComments = extraComments
     }
 }

class listDrinks: ObservableObject {
    @Published var drinkList:[userDrinkInfo]
    
    init(){
        self.drinkList = [
            userDrinkInfo(userName: "KGLover", drinkName: "Coffee Tornado", bean:"Arcadia", roast:"Medium", sugar:"Splenda", milkType:"Whole milk", flavor:"Chocolate", temp:"Cold", creamerLevel: "5%", sugarBags: "2", texture: "smooth", level: "5%", extraComments: "This coffee is great for an quick wake up in the morning!"),
            userDrinkInfo(userName: "Stephen", drinkName: "Coffee Hurricane", bean:"Robusta", roast:"Dark", sugar:"Equal", milkType:"2% milk", flavor:"Caramel", temp:"Cold", creamerLevel: "5%", sugarBags: "2", texture: "None", level: "5%", extraComments: "This coffee is great for an quick wake up in the afternoon!"),
            userDrinkInfo(userName: "Barabara", drinkName: "Coffee Cyclone", bean:"Liberica", roast:"Light", sugar:"Truvia", milkType:"1% milk", flavor:"Vanilla", temp:"Hot", creamerLevel: "10%", sugarBags: "3", texture: "Steamed", level: "5%", extraComments: "This coffee is great for an quick wake up in the night!"),
            userDrinkInfo(userName: "Blake", drinkName: "Coffee Caramel", bean:"Arcadia", roast:"Medium", sugar:"Splenda", milkType:"Whole milk", flavor:"Chocolate", temp:"Cold", creamerLevel: "5%", sugarBags: "2", texture: "smooth", level: "5%", extraComments: "This coffee is great for an quick wake up in the morning!"),
            userDrinkInfo(userName: "Alyssa", drinkName: "Coffee Chocolate", bean:"Robusta", roast:"Dark", sugar:"Equal", milkType:"2% milk", flavor:"Caramel", temp:"Cold", creamerLevel: "5%", sugarBags: "2", texture: "None", level: "5%", extraComments: "This coffee is great for an quick wake up in the afternoon!"),
            userDrinkInfo(userName: "Barabara", drinkName: "Best Coffee", bean:"Liberica", roast:"Light", sugar:"Truvia", milkType:"1% milk", flavor:"Vanilla", temp:"Hot", creamerLevel: "10%", sugarBags: "3", texture: "Steamed", level: "5%", extraComments: "This coffee is great for an quick wake up in the night!")]
    }
    
    
    func addDrink(drink:userDrinkInfo){
        drinkList.append(drink)
    }
    func removeDrink(drink:userDrinkInfo, index: Int){
            drinkList.remove(at: index)
    }
}

//Group Order object
class groupOrder: ObservableObject, Equatable{
    static func == (lhs: groupOrder, rhs: groupOrder) -> Bool {
        return lhs.groupName == rhs.groupName
    }
    @Published var isActive: Bool
    @Published var groupName: String
    @Published var owner: String
    @Published var location: String
    @Published var time: String
    @Published var members: [String]
     
     init() {
        self.isActive = false
        self.groupName = "Group Name"
        self.owner = "Owner"
        self.location = "Location"
        self.time = "time"
        self.members = ["member1", "member2", "member3"]
     }
    init(isActive: Bool, groupName: String, owner: String, location:String, time:String, members:[String]) {
        self.isActive = isActive
        self.groupName = groupName
        self.owner = owner
        self.location = location
        self.time = time
        self.members = members
     }
    
    func activateOrder(){
        isActive = true
    }
    
 }

class listOrder: ObservableObject {
    @Published var orderList = [groupOrder]()
    
    func addOrder(order:groupOrder){
        orderList.append(order)
    }
    func removeDrink(drink:groupOrder){
        if let index = orderList.firstIndex(of: drink){
            orderList.remove(at: index)
        }
    }
}

//Current Friend User's object

class friendDrinkInfo: ObservableObject, Equatable{
    static func == (lhs: friendDrinkInfo, rhs: friendDrinkInfo) -> Bool {
        return lhs.drinkName == rhs.drinkName
            //&& lhs.userName == rhs.userName

    }
    @Published var userName: String
    @Published var drinkName: String
    @Published var temp: String
    @Published var bean: String
    @Published var roast: String
    @Published var sugar: String
    @Published var milkType: String
    @Published var milkFat: String
    @Published var flavor: String
    //The Extra text files
    @Published var creamerLevel: String
    @Published var sugarBags: String
    @Published var texture: String
    @Published var level: String
    @Published var extraComments: String
     
     init() {
        
        self.userName = "Username"
        self.drinkName = "Drink Name"
        self.temp = "temperature"
        self.bean = "Bean Type"
        self.roast = "Roast Level"
        self.sugar = "Sugar Level"
        self.milkType = "Milk Type"
        self.milkFat = "Milk Fat"
        self.flavor = "flavor"
        //The Extra text files
        self.creamerLevel = "Creamer Levels"
        self.sugarBags = "Bags of Sugar"
        self.texture = "Milk Texture"
        self.level = "Milk Level"
        self.extraComments = "Extra Comments"
        
     }
     init(userName: String, drinkName: String, bean:String, roast:String, sugar:String, milkType:String, milkFat:String, flavor:String, temp:String, creamerLevel: String, sugarBags: String, texture: String, level: String, extraComments: String) {
        
        self.userName = userName
        self.drinkName = drinkName
        self.temp = temp
        self.bean = bean
        self.roast = roast
        self.sugar = sugar
        self.milkType = milkType
        self.milkFat = milkFat
        self.flavor = flavor
        //The Extra text files
        self.creamerLevel = creamerLevel
        self.sugarBags = sugarBags
        self.texture = texture
        self.level = level
        self.extraComments = extraComments
     }
 }

class listFriendDrinks: ObservableObject {
    @Published var drinkFriendList = [friendDrinkInfo]()
    
    func addDrink(drink:friendDrinkInfo){
        drinkFriendList.append(drink)
    }
    func removeDrink(drink:friendDrinkInfo){
        if let index = drinkFriendList.firstIndex(of: drink){
            drinkFriendList.remove(at: index)
        }
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
