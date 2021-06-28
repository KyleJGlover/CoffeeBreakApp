//
//  ExtraDetailView.swift
//  CoffeeBreakApp
//
//  Created by Kyle Glover on 6/26/21.
//

import SwiftUI

struct ExtraDetailView: View {
    var body: some View {
        ZStack{
            Color("myCoffeeControlColor")
                .ignoresSafeArea()
            VStack{
                HStack {
                    Text("More Details")
                        .font(.title)
                        .frame(width: UIScreen.main.bounds.size.height)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .border(Color.white)
                    Spacer()
                }
                //Drink owner
                Group{
                    //Section for displaying the main drink contents
                    HStack{
                        Group{
                            VStack (alignment:.leading){
                                Text("Creamer Level:")
                                Text("Bags of Sugar:")
                                Text("Milk Texture:")
                                Text("Milk Level:")

                            }
                            VStack (alignment:.leading){
                                Text("The best one!")
                                Text("Hot")
                                Text("bean")
                                Text("coffeeType")

                            }
                        }.font(.title2)
                        .padding()
                        
                                            
                    }
                    //ending for the first section
                    
                    
                }.frame(width: UIScreen.main.bounds.size.width * 2)
                .foregroundColor(Color.white)
                .background(Color.black)
                .border(Color.white)
                HStack{
                    Text("Extra Comments: My Favorite Coffee is small batch roasted by our roasting partner. The beans you order have been roasted within 2-5 days of shipping to assure maximum freshness. We suggest consuming the beans within 2-3 weeks of receiving them for ideal taste.")
                        .padding()
                    Spacer()
                }.frame(width: UIScreen.main.bounds.size.width)
                .foregroundColor(Color.white)
                .background(Color.black)
                .border(Color.white)
                Spacer()
                
            }
           
            
        }
    }
}

struct ExtraDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraDetailView()
    }
}
