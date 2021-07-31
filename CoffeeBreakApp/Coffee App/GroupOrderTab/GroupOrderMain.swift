import SwiftUI



struct GroupOrderMain: View {
    
    //Group order will contain Owner, Location, a time and members (With drinks for each)
    
    @EnvironmentObject var userProfile: Profile
    
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
                                                NavigationLink (
                                                    destination: ViewOrder(order: self.order.orderList[num]))
                                                {
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


//.fontWeight(.semibold)
