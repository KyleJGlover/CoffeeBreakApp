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
                ZStack{
                    Color("myCoffeeControlColor")
                        .ignoresSafeArea()
                    ScrollView{
                            VStack {
                                //Active Group Orders (if any)
                                Spacer()
                                Group{
                                    HStack {
                                        
                                        Text("Active")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .font(.title)
                                            .padding()
                                        Spacer()
                                    }
                                    .background(Color.black)
                                    .cornerRadius(8)
                                    .padding()
                                    VStack{
                                        NavigationLink ( destination: ViewOrder()){
                                            ActiveOrder()
                                        }
                                    }
                                    HStack {
                                        Text("Inactive")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .font(.title)
                                            .padding()
                                        Spacer()
                                    }
                                    
                                    VStack{
                                        NavigationLink ( destination: ViewOrder()){
                                            InactiveOrder()
                                        }.accentColor(.black)
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


