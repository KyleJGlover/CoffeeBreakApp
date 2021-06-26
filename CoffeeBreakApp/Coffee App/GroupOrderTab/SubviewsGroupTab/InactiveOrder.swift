//
//  InactiveOrder.swift
//  MyCoffee
//
//  Created by Kyle Glover on 6/20/21.
//

import SwiftUI

struct InactiveOrder: View {
    @StateObject var order = Order(id: 0, owner: "Kyle", name: "My Order",location: "Philz", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])

    var body: some View {

        VStack{
            
            HStack{
                VStack{
                    Text(self.order.name)
                        .font(.title)
                        .padding(.leading)

                }
                Spacer()
            }.frame(height:40)
            Group{
                HStack{
                    VStack{
                        Text("Owner:")
                            
                            
                    }
                    .padding(.leading)
                    
                    VStack{
                        Text(self.order.owner)
                    }
                    Spacer()
                }
                
                HStack{
                    VStack{
                        Text("Location:")
                    }
                    .padding(.leading)
                    
                    VStack{
                        Text(self.order.location)
                    }
                    Spacer()
                }
                
                HStack{
                    VStack{
                        Text("Members:")
                    }
                    .padding(.leading)
                    
                    HStack{
                        ForEach(0 ..< self.order.members.count){num in
                            Text(order.members[num])
                        }
                    }
                    Spacer()
                }
                
            }
            .frame(height:30)
            .accentColor(.gray)
        }.border(Color.black)
        
    }
}


struct InactiveOrder_Previews: PreviewProvider {
    static var previews: some View {
        InactiveOrder()
    }
}
