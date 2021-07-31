import SwiftUI

struct DetailsView: View{
    
    @ObservedObject var drink: Coffee

    @EnvironmentObject var userProfile:Profile
    
    @State var drinkOwner = Profile()
    
    
    var body:some View{
            ZStack{
                //Background Color
                Color("myCoffeeControlColor")
                .ignoresSafeArea()
                ScrollView(.vertical) {
                        VStack{
                            //Drink owner
                            Group{
                                HStack {
                                    Text("Drink Owned by: \(drinkOwner.username)")
                                        .foregroundColor(Color.white)
                                }.frame(width:UIScreen.main.bounds.size.width)
                                .font(.title)
                                .padding(.top, 20)
                                //Section for displaying the main drink contents
                                HStack{
                                Group{
                                    VStack (alignment:.leading){
                                        Group{
                                            Group{
                                                //Always have a value
                                                Text("Name:")
                                                Text("Temperature:")
                                                Text("Coffee Type:")
                                                Text("Bean Type:")
                                                Text("Roast:")
                                                Text("Flavor:")
                                                Text("Location:")
                                            }
                                            //For both the type and amount
                                            // sugar/number of packets
                                            if drink.sugar != ""{
                                            Text("Sugar:")
                                            Text("Packets of Sugar:")
                                            }
                                            if drink.room_for_milk == true{
                                                Text("Milk:")
                                            }
                                            if drink.room_for_creamer == true{
                                                Text("Creamer:")
                                            }
                                            Text("Favorite:")
                                            
                                        }.padding(.bottom, 5)
                                    }
                                    VStack (alignment:.leading){
                                        Group{
                                            Group{
                                                Text(drink.drinkName ?? "No Name")
                                                Text(drink.temperature ?? "No Temp")
                                                Text(drink.type ?? "No Coffee Type")
                                                Text(drink.bean ?? "No Bean")
                                                Text(drink.roast ?? "No Roast")
                                                Text(drink.flavor ?? "No Flavor")
                                                Text(drink.location ?? "No location")
                                            }
                                            if drink.sugar != ""{
                                                Text(drink.sugar ?? "No Sugar")
                                                Text("\(drink.number_of_sugar_packets ?? 0)")
                                            }
                                            if drink.room_for_milk == true{
                                                Text(drink.milkType ?? "No Milk")
                                            }
                                            if drink.room_for_creamer == true{
                                                Text(drink.creamer ?? "No Creamer")
                                            }
                                            if drink.isFavorite == true{
                                                Text("Yes")
                                            } else{
                                                Text("No")
                                            }
                                        }.padding(.bottom, 5)
                                        

                                    }
                                }.font(.title3)
                                
                                .padding()
                                    
                                
                                
                                    
                                }
                                .frame(width:UIScreen.main.bounds.size.width)
                                
                                //ending for the first section
                                HStack {
                                    Text("Extra Comments: \(drink.extraComments ?? "No Comments")")
                                        .foregroundColor(Color.white)
                                }
                                .padding()
                                .frame(width:UIScreen.main.bounds.size.width)
                                .border(Color.white)
                                
                                if drink.profile_id == userProfile.profile_id{
                                    NavigationLink(
                                        destination: EditDrinkView(drink:drink).environmentObject(userProfile),
                                            label: {
                                        Text("Edit Drinks")
                                            .padding()
                                            .font(.title2)
                                            .border(Color.white)
                                            }
                                    )
                                }
                                
                                
                                if drink.profile_id != userProfile.profile_id{
                                    
                                    HStack{
                                        Button(action: {
                                            drink.profile_id = userProfile.profile_id
                                            drink.addExistingDrink()
                                        }) {
                                            Image(systemName:"plus")
                                                .font(.system(size: 20))
                                            Text("Add drink to my List")
                                                .bold()
                                        }.padding()
                                        .border(Color.white)
                                    }
                                }
                            }.foregroundColor(Color.white)
                            .background(Color.black)
                            
                        }
                        Spacer()
                }
                }.navigationBarTitle("Drink Details")
                .background(Color.black)
            .onAppear(perform: {
                
                drinkOwner.profile_id = drink.profile_id
                drinkOwner.grabOneProfile()
                
            })
    
            }
    }
    



//struct DetailsViewSection_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
