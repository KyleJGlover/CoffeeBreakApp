//
//  SwiftUIView.swift
//  CoffeeBreakApp
//
//  Created by Kyle Glover on 6/26/21.
//

import SwiftUI

struct DetailsView: View{
    
    @State private var isModal: Bool = false
    
    @EnvironmentObject var drinks: listDrinks
    
    var body:some View{
        ZStack{
            //Background Color
            Color("myCoffeeControlColor")
            .ignoresSafeArea()
            
            VStack {
                VStack{
                    //Drink owner
                    Group{
                        
                        HStack {
                            Text("Drink Owned by:")
                            Text("Kyle Glover")
                                .foregroundColor(Color.white)
                        }.font(.title)
                        .padding()
                            
                        
                        //Section for displaying the main drink contents
                        HStack{
                        Group{
                            VStack (alignment:.leading){
                                Text("Name:")
                                Text("Temperature:")
                                Text("Bean Type:")
                                Text("Hot or Cold:")
                                Text("Coffee Style:")
                                Text("Roast:")
                                Text("Milk:")
                                Text("Milk Fat %:")
                            }
                            VStack (alignment:.leading){
                                Text("The best one!")
                                Text("Hot")
                                Text("bean")
                                Text("coffeeType")
                                Text("style")
                                Text("roastLevel")
                                Text("milk")
                                Text("milkFat")
                            }
                        }.font(.title2)
                        .padding()
                            
                        }
                        //ending for the first section
                    
                    VStack{
                        Button("Extra Details") {
                            isModal = true
                        }.sheet(isPresented: $isModal, content: {
                            ExtraDetailView()
                        })
                    }.padding()
                    
                    HStack{
                        Button(action: {
                            
                        }) {
                            Image(systemName:"plus")
                            Text("Add drink to my List")
                                .bold()
                        }.padding()
                    }
                }.frame(width:UIScreen.main.bounds.size.height)
                .foregroundColor(Color.white)
                .background(Color.black)
                .border(Color.white)
                    Spacer()
                }
            }
        }.navigationBarTitle("Details")
    }
        
}

struct SwiftUIView_Previews: PreviewProvider {

    static var previews: some View {
        
        DetailsView()
    }
}
