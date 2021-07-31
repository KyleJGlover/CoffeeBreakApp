import Foundation

struct CreateCoffee: Codable {
    
    var beanType, creamerType: String
    var drinkLocation, drinkType, extraComments, flavor: String
    var isFavorite, isSteamed: Bool
    var milkType, name: String
    var numberOfSugarBags, profileID: Int
    var roastType: String
    var roomForCreamer, roomForMilk: Bool
    var sugarType, temperature: String

    enum CodingKeys: String, CodingKey {
        case beanType = "bean_type"
        case creamerType = "creamer_type"
        case drinkLocation = "drink_location"
        case drinkType = "drink_type"
        case extraComments = "extra_comments"
        case flavor
        case isFavorite = "is_favorite"
        case isSteamed
        case milkType = "milk_type"
        case name
        case numberOfSugarBags = "number_of_sugar_bags"
        case profileID = "profile_id"
        case roastType = "roast_type"
        case roomForCreamer = "room_for_creamer"
        case roomForMilk = "room_for_milk"
        case sugarType = "sugar_type"
        case temperature
    }
    init(){
        // Drink
        self.drinkType = ""
        self.name = ""
        self.temperature = ""
        self.beanType = ""
        self.roastType = ""
        self.sugarType = ""
        self.milkType = ""
        self.flavor = ""
        self.creamerType = ""
        self.drinkLocation = ""
        self.isFavorite = false
        self.profileID = 0

        // Add_On
        self.roomForCreamer = false
        self.numberOfSugarBags = 0
        self.isSteamed = false
        self.roomForMilk = false
        self.extraComments = ""
    }
    func addDrink(returnMessage: Message, options: CoffeeOptions) {
        
        self.createDrink(returnMessage: returnMessage, options: options)
        
     }
    func createDrink(returnMessage:Message, options: CoffeeOptions){
        
        guard let url = URL(string:"http://127.0.0.1:5000/drink/create") else {
            print("Invalid URL")
            return }
        
            guard let encoded = try? JSONEncoder().encode(self)
            else {
                print("Falied to encode coffee")
                return
            }
        
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        downloadData(request: request) { (returnedData) in
            if let data = returnedData {
                guard let message = try? JSONDecoder().decode(Message.self, from: data) else { return }
                DispatchQueue.main.async {
                    options.clearOptions()
                    returnMessage.message = message.message
                }
            } else {
                print("No data returned.")
            }

        }

    }
}
