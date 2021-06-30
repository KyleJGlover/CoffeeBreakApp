//
//  InactiveOrder.swift
//  MyCoffee
//
//  Created by Kyle Glover on 6/20/21.
//

import SwiftUI

struct InactiveOrder: View {
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
                    }.padding(.leading)
                    Spacer()
                    VStack{
                        Text("Date: \(self.order.date)")
                    }
                    .padding(.trailing)
                }
                
                HStack{
                    VStack{
                        Text("Location: \(self.order.location)")
                    }.padding(.leading)
                    Spacer()
                }
                
                HStack{
                    VStack{
                        Text("Members: ")
                    }
                    .padding(.leading)
                    
                    HStack{
                        ForEach(0 ..< self.order.members.count){num in
                            Text("\(self.order.members[num])")
                        }
                    }
                    Spacer()
                }
                
            }
            .frame(height:30)
            .accentColor(.gray)
        }.border(Color.black)
        .onAppear(perform: {
            print("Active Order")
            //order.addOrder()
        })
        
    }
}


struct InactiveOrder_Previews: PreviewProvider {
    @StateObject static var order: Order = Order(isActive: true, owner: "Kyle", name: "My Order",time:"4:00PM", date: "06/05/2021", location: "Philz", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])

    static var previews: some View {
        
        InactiveOrder(order: order)
    }
}
