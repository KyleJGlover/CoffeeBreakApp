import SwiftUI


struct CreateNewDrinkBtn: View{
    
    @EnvironmentObject var userProfile: Profile

    var body: some View{
            VStack (alignment:.center){
                HStack{
                    NavigationLink(
                        destination: CreateNewDrinkView().environmentObject(userProfile),
                            label: {
                                Text(" Create New Drink! ")
                                    .font(.title)
                                    .frame(width: UIScreen.main.bounds.size.width - 50)
                                    .foregroundColor(Color.white)
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
            
                    })
            
                }
            }
    }
}

struct CreateNewDrinkView: View{
    
    @EnvironmentObject var userProfile: Profile
    
    @State var newCoffee: CreateCoffee = CreateCoffee()
    
    @ObservedObject var options: CoffeeOptions = CoffeeOptions()
    
    @ObservedObject var message: Message = Message()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body:some View{
        ZStack{
            Color(.black)
            .edgesIgnoringSafeArea(.all)
            VStack{
                    Form{
                        Section(footer: Text("Please enter all information above before pressing save")){
                            
                                TextField("Drink Name", text: $newCoffee.name)
                                
                                Picker("Hot or Cold", selection: $options.tempType){
                                    ForEach(0 ..< CoffeeOptions.tempTypeOptions.count){
                                        Text(CoffeeOptions.tempTypeOptions[$0])
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                
                                TextField("Type of Coffee e.g. (Espresso Shot)", text: $newCoffee.drinkType)
                                
                                Picker("Type of Coffee Bean", selection: $options.beanType){
                                    ForEach(0 ..< CoffeeOptions.beanTypeOptions .count){
                                        Text(CoffeeOptions.beanTypeOptions[$0])
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                
                                Picker("Roast Type", selection: $options.roastType){
                                    ForEach(0 ..< CoffeeOptions.roastLevelOptions.count){
                                        Text(CoffeeOptions.roastLevelOptions[$0])
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                
                                Picker("Flavor Type", selection: $options.flavorType){
                                    ForEach(0 ..< CoffeeOptions.flavorOptions.count){
                                        Text(CoffeeOptions.flavorOptions[$0])
                                    }
                                }
                                Group{
                                    
                                    Section {
                                        Toggle(isOn: $options.creamerToggle.animation()){
                                            Text("Add Creamer Options")
                                        }
                                        if options.creamerToggle {
                                            TextField("Creamer Type", text: $newCoffee.creamerType)
                                        }
                                        
                                    }
                                    
                                    Section {
                                        Toggle(isOn: $options.milkToggle.animation()){
                                            Text("Add Milk Options")
                                        }
                                        if options.milkToggle {
                                            
                                            Picker("Milk Type", selection: $options.milkType){
                                                ForEach(0 ..< CoffeeOptions.milkTypeOptions.count){
                                                    Text(CoffeeOptions.milkTypeOptions[$0])
                                                }
                                            }
                                            
                                            Toggle(isOn: $options.isSteamed){
                                                Text("Do you like it steamed?")
                                            }
                                        }
                                    }
                                    Section {
                                        Toggle(isOn: $options.sugarToggle.animation()){
                                            Text("Add Sugar Options")
                                        }
                                        if options.sugarToggle {
                                            Picker("Sugar Type", selection: $options.sugar){
                                                ForEach(0 ..< CoffeeOptions.sugarOptions.count){
                                                    Text(CoffeeOptions.sugarOptions[$0])
                                                }
                                            }
                                            Stepper(value: $options.sugarPackets, in: 0...7){
                                                Text("Sugar packets:  \(options.sugarPackets)")
                                            }
                                        }
                                        
                                    }
                                    Toggle(isOn: $options.isFavorite){
                                        Text("Favorite")
                                    }
                                    TextField("Favorite location to buy.", text: $newCoffee.drinkLocation)

                                    TextField("Extra Comments", text: $newCoffee.extraComments)
                                }// extras
                        }
                        HStack{
                            Spacer()
                            Button(action:{
                                newCoffee.temperature = CoffeeOptions.tempTypeOptions[options.tempType]
                                newCoffee.beanType = CoffeeOptions.beanTypeOptions[options.beanType]
                                newCoffee.roastType = CoffeeOptions.roastLevelOptions[options.roastType]
                                newCoffee.flavor = CoffeeOptions.flavorOptions[options.flavorType]
                                
                                newCoffee.roomForMilk = options.milkToggle
                                newCoffee.milkType = CoffeeOptions.milkTypeOptions[options.milkType]
                                
                                newCoffee.isSteamed = options.isSteamed
                                
                                newCoffee.isFavorite = options.isFavorite
                                                    
                                newCoffee.roomForCreamer = options.creamerToggle
                                
                                newCoffee.sugarType = CoffeeOptions.sugarOptions[options.sugar]
                                newCoffee.numberOfSugarBags = options.sugarPackets
                                
                                newCoffee.profileID = userProfile.profile_id
                                
                                newCoffee.addDrink(returnMessage: message, options: options)
                                
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Spacer()
                                Text("Create My Drink")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
            }.navigationBarTitle(Text("Create a Drink"), displayMode: .automatic)
            
        }
    }
}


struct CreateNewDrinkBtnSection_Previews: PreviewProvider {
    
    static var previews: some View {
        MyCoffeeTabView()
    }
}

