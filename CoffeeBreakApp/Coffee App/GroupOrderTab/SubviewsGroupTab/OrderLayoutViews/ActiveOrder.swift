
import SwiftUI


struct ActiveOrder: View {
    //Group order will contain Owner, Location, and members (With drinks for each)
    @ObservedObject var order: Order

    

    var body: some View {

            VStack{
                HStack{
                    VStack{
                        Text(self.order.name)
                            .font(.title)
                            .padding(.leading)
                    }
                    Spacer()
                    VStack{
                        Text("Time: \(self.order.time)")
                            .padding(.trailing)
                    }
                    
                }.frame(height:40)
                Group{
                    HStack{
                        VStack{
                            Text("Owner: \(self.order.owner)")
                        }
                        .padding(.leading)

                        Spacer()
                        
                        VStack{
                            Text("Date: \(self.order.date)")
                        }
                        .padding(.trailing)
                    }
                    
                    HStack{
                        VStack{
                            Text("Location: \(self.order.location)")
                        }
                        .padding(.leading)
                        Spacer()
                    }
                    
                    HStack{
                        VStack{
                            Text("Members:")
                        }
                        .padding(.leading)
                        
                        HStack{
                            ForEach(0 ..< self.order.members.count){num in
                                if self.order.members.count != num{
                                    Text("\(self.order.members[num])")
                                }
                            }
                        }
                        Spacer()
                    }
                    
                }
                .frame(height:30)
                .accentColor(.gray)
            }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .onAppear() {
                //self.order.addOrder()
                print("appear")
            }
            .onDisappear(){
                print("disappear")
            }
            
        }
}


struct ActiveOrder_Previews: PreviewProvider {
    @StateObject static var order: Order = Order(isActive: true, owner: "Kyle", name: "My Order",time:"4:00PM", date: "06/05/2021", location: "Philz", address: "134 Bay St", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])

    static var previews: some View {
        
        ActiveOrder(order: order)
    }
}
