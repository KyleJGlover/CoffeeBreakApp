import SwiftUI

class Order: ObservableObject  {

    var id: Int
    @Published var owner: String
    @Published var name: String
    @Published var location: String
    @Published var members: [String]
    @Published var memberDrinksName: [String]
    init(){
        self.id = 0
        self.owner = ""
        self.name = ""
        self.location = ""
        self.members = [""]
        self.memberDrinksName = [""]
    }
    
    init(id:Int, owner:String, name:String, location:String, members:[String], memberDrinksName:[String] ){
        self.id = id
        self.owner = owner
        self.name = name
        self.location = location
        self.members = members
        self.memberDrinksName = memberDrinksName
    }
    
}

struct GroupOrderMain: View {
    
    //Group order will contain Owner, Location, and members (With drinks for each)
    
    @ObservedObject var order = Order(id: 0, owner: "Kyle", name: "My Order",location: "Philz", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
    
    
    var body: some View {
            NavigationView {
                    ScrollView{
                            VStack {
                                //Active Group Orders (if any)
                                HStack {
                                    Text("Active")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .font(.title)
                                        .padding()
                                    Spacer()
                                }
                                VStack{
                                    NavigationLink ( destination: ViewOrder()){
                                        ActiveOrder()
                                    }.accentColor(.black)
                                }
                                HStack {
                                    Text("Inactive")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .font(.title)
                                        .padding()
                                    Spacer()
                                }
                                Spacer()
                                VStack{
                                    NavigationLink ( destination: ViewOrder()){
                                        InactiveOrder()
                                    }.accentColor(.black)
                                }
                                Spacer()
                                VStack{
                                    NavigationLink ( destination: CreateOrder()){
                                        CreateOrderButton()
                                    }.accentColor(.black)
                                }
                                
                                    
                            
                        }.navigationBarTitle(Text("MyGroupOrder"), displayMode: .automatic)
                            .accentColor(.blue)
                    }

            }
        }
}


struct CreateOrderButton: View {
    var body: some View{
                VStack{
                            Text("Create a Group Order")
                }.frame(width: 300, height: 30)
                    .accentColor(.white)
                    .background(Color.black)
                    .cornerRadius(25)
                    .padding()
    }
}

struct GroupOrderMain_Previews: PreviewProvider {
    static var previews: some View {
        GroupOrderMain()
    }
}


//                VStack {
//                    RecentDrinksViewSection()
//                    Spacer()
//                    VStack (alignment:.center){
//                        Spacer()
//                        CreateNewDrinkBtnSection()
//                        Spacer()
//                    }.frame(height:50)
//                    Spacer()
//                    VStack{
//                        listOfCoffeeSection()
//                    }
//                    Spacer()
//                }.frame(maxWidth: .infinity, maxHeight:.infinity)
//                .background(Color("myCoffeeControlColor"))
//                .edgesIgnoringSafeArea(.all)
