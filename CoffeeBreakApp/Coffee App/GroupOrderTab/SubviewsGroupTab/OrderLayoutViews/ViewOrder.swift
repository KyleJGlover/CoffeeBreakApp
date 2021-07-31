//
//  ViewOrder.swift
//  MyCoffee
//
//  Created by Kyle Glover on 6/19/21.
//

import SwiftUI

struct ViewOrder: View {
    
    @State private var isModal: Bool = false
    
    
    
    @ObservedObject var order: Order

    var body: some View {
        ZStack{
            Color("myCoffeeControlColor")
                .ignoresSafeArea()
//            VStack (alignment:.leading){
//                Group{
//
//                    Group{
//
//                        HStack{
//                            Text("Name:")
//                                .underline()
//                            Text(self.order.name)
//                            Spacer()
//                        }
//                        HStack{
//                            Text("Owner:")
//                                .underline()
//                            Text(self.order.owner)
//                            Spacer()
//                        }
//                        HStack{
//                            Text("Location:")
//                                .underline()
//                            Text(self.order.location)
//                            Spacer()
//
//                        }
//                        HStack{
//                            Text("Address:")
//                                .underline()
//                            Text("123 Bay ST")
//                            Spacer()
//
//                        }
//                    }.font(.title2)
//                    .padding()
//
//                    HStack{
//                        Group{
//                        Text("Members")
//                            .underline()
//                            .padding()
//                        Spacer()
//                        Text("Drinks")
//                            .underline()
//                            .padding()
//                        }.font(.title2)
//                    }
//
//                    HStack{
//                        VStack(alignment:.leading){
//                            ForEach(0 ..< self.order.members.count){num in
//                                HStack{
//                                    Group{
//                                        VStack{
//                                            Text(self.order.members[num])
//                                        }
//
//                                    Spacer()
//                                        if self.order.members[num] == self.order.owner{
//                                            VStack{
//                                                Button(action: {
//                                                    isModal = true
//                                                }) {
//                                                    Image(systemName:"plus")
//                                                }.sheet(isPresented: $isModal, content: {
//                                                    DetailsView()
//                                                })
//                                                .padding()
//                                            }
//                                        } else{
//                                            VStack{
//                                                Image (systemName:"arrow.right")
//                                            }
//                                        }
//                                    Spacer()
//                                        Text(self.order.memberDrinksName[num])
//                                    }.padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//
//                                }
//                            }
//                        }
//                        .font(.title2)
//
//                    }.padding()
//
//                }
//                .background(Color.black)
//                .foregroundColor(Color.white)
//                .border(Color.white)
//            }.onAppear(perform: {
//                print("Active Order")
//                //order.addOrder()
//            })
        }
    }
}

struct ViewOrder_Previews: PreviewProvider {
    @StateObject static var order: Order = Order( isActive: true, owner: "Kyle", name: "My Order",time:"4:00PM", date: "06/05/2021", location: "Philz", address: "134 Bay St", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])

    static var previews: some View {
        
        ViewOrder(order: order)
    }
}
