import Foundation

class Order: ObservableObject, Identifiable  {

    var id: Int = 0
    @Published var isActive: Bool = false
    @Published var owner: String = ""
    @Published var name: String = ""
    @Published var time:String = ""
    @Published var date: String = ""
    @Published var location: String = ""
    @Published var address: String = ""

    
    enum CodingKeys: String, CodingKey {
        // Key names for API call of a drink Object
        // Attribute = "Key name of the attribute sent to the API"
        case drink_id = "drink_id"
        case profile_id = "profile_id"
        case drinkName = "name"
        case temperature
        case bean = "bean_type"
        case roast = "roast_type"
        case sugar = "sugar_type"
        case creamer = "creamer_type"
        case milkType = "milk_type"
        case flavor
        case location = "drink_location"
        case type = "drink_type"
        // Add ons for determining amounts if any
        case room_for_creamer = "room_for_creamer"
        case number_of_sugar_bags = "number_of_sugar_bags"
        case isSteamed
        case isFavorite = "is_favorite"
        case room_for_milk = "room_for_milk"
        case extraComments = "extra_comments"
        
    }
    init(){
        self.isActive = true
        self.owner = "Owner"
        self.name = ""
        self.time = "Time"
        self.date = "Date"
        self.location = "Location"
        self.address = ""
 
    }
    
    init( isActive:Bool, owner:String, name:String, time:String, date:String, location:String, address:String, members:[String], memberDrinksName:[String] ){
        self.isActive = isActive
        self.owner = owner
        self.name = name
        self.time = time
        self.date = date
        self.location = location
        self.address = address
    }
    
}


class OrderList: ObservableObject{
    @Published var orderList: [Order] = []
    @Published var isLoading: Bool = false
    //suppose to be add order but the onappear() function is not working
    init(){
        let order1 = Order( isActive: true, owner: "Kyle", name: "Color",time:"4:00PM", date: "06/05/2021", location: "Philz", address: "134 Bay St", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
        let order2 = Order( isActive: true, owner: "Stephen", name: "JNJ",time:"4:00PM", date: "08/01/2021", location: "Philz", address: "134 Bay St", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
        let order3 = Order( isActive: false, owner: "Blake", name: "CSC688",time:"4:00PM", date: "01/08/2021", location: "Philz", address: "134 Bay St", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
        
//        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.orderList.append(order1)
            self.orderList.append(order2)
            self.orderList.append(order3)
            
            self.isLoading = true

//        }
        
    }
    func deleteOrder(index: IndexSet){
        orderList.remove(atOffsets: index)
    }
}

class Member: ObservableObject, Identifiable  {

    var id: Int = 0
    @Published var isActive: Bool = false
    @Published var owner: String = ""
    @Published var name: String = ""
    @Published var time:String = ""
    @Published var date: String = ""
    @Published var location: String = ""
    @Published var address: String = ""
    @Published var members: [String] = [""]
    @Published var memberDrinksName: [String] = [""]
    
    enum CodingKeys: String, CodingKey {
        // Key names for API call of a drink Object
        // Attribute = "Key name of the attribute sent to the API"
        case drink_id = "drink_id"
        case profile_id = "profile_id"
        case drinkName = "name"
        case temperature
        case bean = "bean_type"
        case roast = "roast_type"
        case sugar = "sugar_type"
        case creamer = "creamer_type"
        case milkType = "milk_type"
        case flavor
        case location = "drink_location"
        case type = "drink_type"
        // Add ons for determining amounts if any
        case room_for_creamer = "room_for_creamer"
        case number_of_sugar_bags = "number_of_sugar_bags"
        case isSteamed
        case isFavorite = "is_favorite"
        case room_for_milk = "room_for_milk"
        case extraComments = "extra_comments"
        
    }
    init(){
        self.isActive = true
        self.owner = "Owner"
        self.name = ""
        self.time = "Time"
        self.date = "Date"
        self.location = "Location"
        self.address = ""
        self.members = ["Members"]
        self.memberDrinksName = [""]
    }
    
    init( isActive:Bool, owner:String, name:String, time:String, date:String, location:String, address:String, members:[String], memberDrinksName:[String] ){
        self.isActive = isActive
        self.owner = owner
        self.name = name
        self.time = time
        self.date = date
        self.location = location
        self.address = address
        self.members = members
        self.memberDrinksName = memberDrinksName
    }
    
}


class MemberList: ObservableObject{
    @Published var orderList: [Member] = []
    @Published var isLoading: Bool = false
        
}
    
