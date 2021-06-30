import SwiftUI

class Order: ObservableObject  {

    var id: UUID = UUID()
    @Published var isActive: Bool = false
    @Published var owner: String = ""
    @Published var name: String = ""
    @Published var time:String = ""
    @Published var date: String = ""
    @Published var location: String = ""
    @Published var members: [String] = [""]
    @Published var memberDrinksName: [String] = [""]
    init(){
        self.isActive = true
        self.owner = "Owner"
        self.name = "Name"
        self.time = "Time"
        self.date = "Date"
        self.location = "Location"
        self.members = [""]
        self.memberDrinksName = [""]
    }
    
    init( isActive:Bool, owner:String, name:String, time:String, date:String, location:String, members:[String], memberDrinksName:[String] ){
        self.isActive = isActive
        self.owner = owner
        self.name = name
        self.time = time
        self.date = date
        self.location = location
        self.members = members
        self.memberDrinksName = memberDrinksName
    }
    
}


class OrderList: ObservableObject{
    @Published var orderList: [Order] = []
    @Published var isLoading: Bool = false
    //suppose to be add order but the onappear() function is not working
    init(){
        let order1 = Order( isActive: true, owner: "Kyle", name: "Color",time:"4:00PM", date: "06/05/2021", location: "Philz", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
        let order2 = Order( isActive: true, owner: "Stephen", name: "JNJ",time:"4:00PM", date: "08/01/2021", location: "Philz", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
        let order3 = Order( isActive: false, owner: "Blake", name: "CSC688",time:"4:00PM", date: "01/08/2021", location: "Philz", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
        
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

struct GroupOrderMain: View {
    
    //Group order will contain Owner, Location, a time and members (With drinks for each)
    
    @StateObject var order: OrderList = OrderList()
    
    
    var body: some View {
            NavigationView {
                ZStack{
                    Color("myCoffeeControlColor")
                        .ignoresSafeArea()
                    ScrollView{
                            VStack {
                                //Active Group Orders (if any)
                                Spacer()
                                Group{
                                    HStack {
                                        //active orders
                                        Text("Active")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .font(.title)
                                        Spacer()
                                    }
                                    .background(Color.black)
                                    .cornerRadius(8)
                                    .padding()
                                    ForEach( 0 ..< self.order.orderList.count) { num in
                                        if self.order.orderList[num].isActive{
                                            VStack{
                                                NavigationLink ( destination: ViewOrder(order: self.order.orderList[num])){
                                                    ActiveOrder(order: self.order.orderList[num])
                                                }
                                            }.padding()
                                        }
                                    }
                                    
                                    HStack {
                                        Text("Inactive")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .font(.title)
                                            .padding()
                                        Spacer()
                                    }
                                    ForEach( 0 ..< self.order.orderList.count) { num in
                                        if !self.order.orderList[num].isActive{
                                            VStack{
                                                NavigationLink ( destination: ViewOrder(order: self.order.orderList[num])){
                                                    InactiveOrder(order:self.order.orderList[num])
                                                }.accentColor(.black)
                                            }.padding()
                                        }
                                    }
                                    
                                }.frame(width:UIScreen.main.bounds.size.width - 20)
                                .background(Color.black)
                                .cornerRadius(8)
                                VStack{
                                    NavigationLink ( destination: CreateOrder()){
                                        CreateOrderButton()
                                    }
                                }
                            
                        }.navigationBarColor(backgroundColor: .black, titleColor: .white)
                            //Above colors the Navigation bar
                        .navigationBarTitle(Text("MyGroupOrder"), displayMode: .automatic)
                        
                    }
                }.foregroundColor(Color.white)

            }
        }
}


struct CreateOrderButton: View {
    var body: some View{
                VStack{
                    Text("Create a Group Order")
                        .font(.title2)
                        .bold()
                }.frame(width: UIScreen.main.bounds.size.width - 50, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(25)
                    .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    .padding()
    }
}

struct GroupOrderMain_Previews: PreviewProvider {
    static var previews: some View {
        GroupOrderMain()
    }
}


