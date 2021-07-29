import Foundation

class Coffee: ObservableObject, Identifiable, Codable{
    
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
    // Publishes each variable and tracks any changes then updates those changes everywhere
    @Published var profile_id: Int?
    @Published var drink_id: Int?
    //need to change later
    //Drink
    @Published var bean: String?
    @Published var creamer:String?
    @Published var location:String?
    @Published var type:String?
    @Published var drinkName: String?
    @Published var temperature: String?
    @Published var roast: String?
    @Published var sugar: String?
    @Published var milkType: String?
    @Published var flavor: String?
    
    // Add-On
    @Published var room_for_creamer: Bool?
    @Published var number_of_sugar_packets: Int?
    @Published var isFavorite: Bool?
    @Published var isSteamed: Bool?
    @Published var room_for_milk: Bool?
    @Published var extraComments: String?
     
    init(){
        grabDrink()
    }
    func grabDrink(){
        
            guard let url = URL(string:"http://127.0.0.1:5000/drink/one/1") else {
                print("Invalid URL")
                return }
            
            var request = URLRequest(url:url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            downloadData(request: request) { (returnedData) in
                if let data = returnedData {
                    guard let coffee = try? JSONDecoder().decode(Coffee.self, from: data) else { return print("data was not decoded") }
                    DispatchQueue.main.async { [weak self] in
                        
                        //Drink
                        self?.type = coffee.type
                        self?.drinkName = coffee.drinkName
                        self?.temperature = coffee.temperature
                        self?.bean = coffee.bean
                        self?.roast = coffee.roast
                        self?.sugar = coffee.sugar
                        self?.milkType = coffee.milkType
                        self?.flavor = coffee.flavor
                        self?.creamer = coffee.creamer
                        self?.location = coffee.location
                        self?.isFavorite = coffee.isFavorite
                        self?.profile_id = coffee.profile_id
                        self?.drink_id = coffee.drink_id

                        // Add_On
                        self?.room_for_creamer = coffee.room_for_creamer
                        self?.number_of_sugar_packets = coffee.number_of_sugar_packets
                        self?.isSteamed = coffee.isSteamed
                        self?.room_for_milk = coffee.room_for_milk
                        self?.extraComments = coffee.extraComments
                    }
                } else {
                    print("No data returned.")
                }

            }
        }

    
    required init(from decoder: Decoder) throws {
        let decodeCoffee = try decoder.container(keyedBy: CodingKeys.self)
        
        // Drink
        drink_id = try decodeCoffee.decode(Int.self, forKey: .drink_id)
        profile_id = try decodeCoffee.decode(Int.self, forKey: .profile_id)
        drinkName = try decodeCoffee.decode(String.self, forKey: .drinkName)
        temperature = try decodeCoffee.decode(String.self, forKey: .temperature)
        bean = try decodeCoffee.decode(String.self, forKey: .bean)
        roast = try decodeCoffee.decode(String.self, forKey: .roast)
        sugar = try decodeCoffee.decode(String.self, forKey: .sugar)
        creamer = try decodeCoffee.decode(String.self, forKey: .creamer)
        milkType = try decodeCoffee.decode(String.self, forKey: .milkType)
        flavor = try decodeCoffee.decode(String.self, forKey: .flavor)
        location = try decodeCoffee.decode(String.self, forKey: .flavor)
        isFavorite = try decodeCoffee.decode(Bool.self, forKey: .isFavorite)
        type = try decodeCoffee.decode(String.self, forKey: .type)
    
        // Add_on
        room_for_creamer = try decodeCoffee.decode(Bool.self, forKey: .room_for_creamer)
        number_of_sugar_packets = try decodeCoffee.decode(Int.self, forKey: .number_of_sugar_bags)
        isSteamed = try decodeCoffee.decode(Bool.self, forKey: .isSteamed)
        room_for_milk = try decodeCoffee.decode(Bool.self, forKey: .room_for_milk)
        extraComments = try decodeCoffee.decode(String.self, forKey: .extraComments)
    
        }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //Drink
        try container.encode(drinkName, forKey: .drinkName)
        try container.encode(temperature, forKey: .temperature)
        try container.encode(bean, forKey: .bean)
        try container.encode(roast, forKey: .roast)
        try container.encode(type, forKey: .type)
        try container.encode(creamer, forKey: .creamer)
        try container.encode(sugar, forKey: .sugar)
        try container.encode(milkType, forKey: .milkType)
        try container.encode(location, forKey: .location)
        try container.encode(flavor, forKey: .flavor)
        try container.encode(isFavorite, forKey: .isFavorite)
        try container.encode(profile_id, forKey: .profile_id)
        try container.encode(drink_id, forKey: .drink_id)

        //Add_On
        try container.encode(number_of_sugar_packets, forKey: .number_of_sugar_bags)
        try container.encode(room_for_creamer, forKey: .room_for_creamer)
        try container.encode(isSteamed, forKey: .isSteamed)
        try container.encode(room_for_milk, forKey: .room_for_milk)
        try container.encode(extraComments, forKey: .extraComments)

    }
    
    func addExistingDrink(){
        
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
                guard let coffee = try? JSONDecoder().decode(Coffee.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    //Drink
                    self?.type = coffee.type
                    self?.drinkName = coffee.drinkName
                    self?.temperature = coffee.temperature
                    self?.bean = coffee.bean
                    self?.roast = coffee.roast
                    self?.sugar = coffee.sugar
                    self?.milkType = coffee.milkType
                    self?.flavor = coffee.flavor
                    self?.creamer = coffee.creamer
                    self?.location = coffee.location
                    self?.isFavorite = coffee.isFavorite
                    self?.profile_id = coffee.profile_id

                    // Add_On
                    self?.room_for_creamer = coffee.room_for_creamer
                    self?.number_of_sugar_packets = coffee.number_of_sugar_packets
                    self?.isSteamed = coffee.isSteamed
                    self?.room_for_milk = coffee.room_for_milk
                    self?.extraComments = coffee.extraComments
                }
            } else {
                print("No data returned.")
            }

        }
        
        
    }
    
    func updateDrink(){
        updateDatabase()
    }
    
    func updateDatabase(){
        
        guard let url = URL(string:"http://127.0.0.1:5000/drink/update") else {
            print("Invalid URL")
            return }
        
            guard let encoded = try? JSONEncoder().encode(self)
            else {
                print("Falied to encode coffee")
                return
            }
        
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PUT"
        request.httpBody = encoded
        
        downloadData(request: request) { (returnedData) in
            if let data = returnedData {
                guard let coffee = try? JSONDecoder().decode(Coffee.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    //Drink
                    self?.type = coffee.type
                    self?.drinkName = coffee.drinkName
                    self?.temperature = coffee.temperature
                    self?.bean = coffee.bean
                    self?.roast = coffee.roast
                    self?.sugar = coffee.sugar
                    self?.milkType = coffee.milkType
                    self?.flavor = coffee.flavor
                    self?.creamer = coffee.creamer
                    self?.location = coffee.location
                    self?.isFavorite = coffee.isFavorite
                    self?.profile_id = coffee.profile_id

                    // Add_On
                    self?.room_for_creamer = coffee.room_for_creamer
                    self?.number_of_sugar_packets = coffee.number_of_sugar_packets
                    self?.isSteamed = coffee.isSteamed
                    self?.room_for_milk = coffee.room_for_milk
                    self?.extraComments = coffee.extraComments
                }
            } else {
                print("No data returned.")
            }

        }
        
        
    }
}

class listDrinks: ObservableObject, Identifiable {
    
    @Published var drinkList:[Coffee] = []
    
    func grabListData(profile_id:Int){
        
        guard let url = URL(string:"http://127.0.0.1:5000/drink/all/\(profile_id)") else {
            print("Invalid URL")
            return }
        
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        //request.httpBody = encoded
        
        downloadData(request: request) { (returnedData) in
            if let data = returnedData {
                guard let coffeeList = try? JSONDecoder().decode([Coffee].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.drinkList = coffeeList
                }
            } else {
                print("No data returned.")
            }

        }
    }
        
    
    func grabOneCoffee(drink_id:Int){
        guard let url = URL(string:"http://127.0.0.1:5000/drink/one/\(drink_id)") else {
            print("Invalid URL")
            return }
        
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        downloadData(request: request) { (returnedData) in
            if let data = returnedData {
                guard let coffee = try? JSONDecoder().decode(Coffee.self, from: data) else { return print("data was not decoded") }
                DispatchQueue.main.async { [weak self] in
                    self?.drinkList.append(coffee)
                }
            } else {
                print("No data returned.")
            }

        }
    }
}


func downloadData( request: URLRequest, completionHandler: @escaping (_ data: Data?) -> ()) {
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
    
        guard
            let data = data,
            error == nil,
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            print("Error in downloading data.")
            print(data ?? "Data Bad")
            completionHandler(nil)
            return
        }
        let jseonstring = String (data:data, encoding: .utf8)
        print(jseonstring ?? "no data")
        completionHandler(data)
        
    }.resume()
}
