//
//  ViewOrder.swift
//  MyCoffee
//
//  Created by Kyle Glover on 6/19/21.
//

import SwiftUI

struct ViewOrder: View {
    
    @State private var isModal: Bool = false
    
    
    @StateObject var order = Order(id: 0, owner: "Kyle", name: "My Order",location: "Philz", members: ["Kyle", "Blake", "Stephen", "Alyssa"], memberDrinksName: ["Kyle's Fav", "Blake's Fav", "Stephen's Fav", "Alyssa's Fav"])
    var body: some View {
        ZStack{
            Color("myCoffeeControlColor")
                .ignoresSafeArea()
            VStack (alignment:.leading){
                Group{
                
                    Group{
                        
                            HStack{
                                Text("Name:")
                                    .underline()
                                Text(self.order.name)
                                Spacer()
                            }
                        HStack{
                            Text("Owner:")
                                .underline()
                            Text(self.order.owner)
                            Spacer()
                        }
                        HStack{
                            Text("Location:")
                                .underline()
                            Text(self.order.name)
                            Spacer()

                        }
                        HStack{
                            Text("Address:")
                                .underline()
                            Text("123 Bay ST")
                            Spacer()
                            
                        }
                    }.font(.title)
                    .padding()
                    
                    HStack{
                        Group{
                        Text("Members")
                            .underline()
                            .padding()
                        Spacer()
                        Text("Drinks")
                            .underline()
                            .padding()
                        }.font(.system(size: 25))
                    }
                    
                    HStack{
                        VStack(alignment:.leading){
                            ForEach(0 ..< self.order.members.count){num in
                                HStack{
                                    Group{
                                        VStack{
                                            Text(order.members[num])
                                        }
                                        
                                    Spacer()
                                        if order.members[num] == order.owner{
                                            VStack{
                                                Button(action: {
                                                    isModal = true
                                                }) {
                                                    Image(systemName:"plus")
                                                }.sheet(isPresented: $isModal, content: {
                                                    ExtraDetailView()
                                                })
                                                .padding()
                                            }
                                        } else{
                                            VStack{
                                                Image (systemName:"arrow.right")
                                            }
                                        }
                                    Spacer()
                                    Text(order.memberDrinksName[num])
                                    }.padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        
                                }
                            }
                        }
                        .font(.system(size: 20))
                        
                    }.padding()
                    
                    
    //                VStack{
    //                    ForEach(0 ..< self.order.members.count){num in
    //                        HStack{
    //
    //                            Text(order.members[num])
    //
    //                            Spacer()
    //                            Image (systemName:"arrow.right")
    //
    //                            Spacer()
    //                            Text(order.memberDrinksName[num])
    //
    //
    //                            if order.members[num] == order.owner{
    //                                NavigationLink(destination: AddDrinkOrder()){
    //                                    Image(systemName:"plus")
    //                                        .frame(width: 30)
    //                                }.frame(width: 30)
    //                                .foregroundColor(Color.black)
    //
    //
    //                            }
    //
    //                        }
    //                    }
    //                }
    //                .font(.system(size: 25))


                
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .border(Color.white)
            }
        }
    }
}

struct ViewOrder_Previews: PreviewProvider {
    static var previews: some View {
        ViewOrder()
    }
}
