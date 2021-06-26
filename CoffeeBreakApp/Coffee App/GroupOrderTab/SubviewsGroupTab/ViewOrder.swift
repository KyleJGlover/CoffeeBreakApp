//
//  ViewOrder.swift
//  MyCoffee
//
//  Created by Kyle Glover on 6/19/21.
//

import SwiftUI

struct ViewOrder: View {
    
    @StateObject var order = Order(id: 0, owner: "Kyle", name: "My Order",location: "Philz", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
    var body: some View {
        GeometryReader{ geo in
            List {
                Group{
                    
                    HStack{
                        Text("Name:")
                            .font(.title)
                            .underline()
                        Text(self.order.name)
                            .font(.title)
                    }
                    HStack{
                        Text("Owner:")
                            .underline()
                            .font(.title)
                        Text(self.order.owner)
                            .font(.title)
                    }
                    HStack{
                        Text("Location:")
                            .underline()
                            .font(.title)
                        Text(self.order.name)
                            .font(.title)
                    }
                    HStack{
                        Text("Address:")
                            .underline()
                            .font(.title)
                        Text("123 Bay ST")
                            .font(.title)
                    }
                }
                VStack{
                    
                    Spacer()
                    
                    HStack{
                        Text("Members")
                            .underline()
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer ()
                        Text("Coffee Drinks")
                            .underline()
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                    
                    VStack{
                        ForEach(0 ..< self.order.members.count){num in
                            HStack{
                                Spacer()
                                
                                Text(order.members[num])
                                Spacer()
                                Image (systemName:"arrow.right")
                                Spacer()
                                Text(order.memberDrinksName[num])
                                Spacer()
                            }
                        }

                            
                            
//                            VStack{
//                                Group {
//                                    Text("Kyle")
//                                    Text("Kyle")
//                                    Text("Kyle")
//                                }.padding(.leading, 30)
//                                .padding()
//                            }
//                           Spacer()
//                            VStack{
//                                Group{
//                                    Image(systemName:"arrow.right")
//                                        .frame(width: geo.size.width * 0.1)
//                                    Image(systemName:"arrow.right")
//                                        .frame(width: geo.size.width * 0.1)
//                                    Image(systemName:"arrow.right")
//                                        .frame(width: geo.size.width * 0.1)
//                                }.padding()
//                            }
//                            Spacer ()
//                            VStack{
//                                Group{
//                                    Text("Drink")
//                                    Text("Drink")
//                                    Text("Drink")
//                                }.padding(.trailing, 30)
//                                .padding()
//                            }
                        }
                        .font(.system(size: 25))

                }
            }
                
                
                
            }
    }
}

struct ViewOrder_Previews: PreviewProvider {
    static var previews: some View {
        ViewOrder()
    }
}
