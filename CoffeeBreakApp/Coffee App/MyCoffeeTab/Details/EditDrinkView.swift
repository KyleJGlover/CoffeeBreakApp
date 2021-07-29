import SwiftUI

struct EditDrinkView: View {
    
    @EnvironmentObject var userProfile: Profile
    
    @ObservedObject var drink:Coffee
    
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
                            
                                TextField("Drink Name", text: $options.drinkName)
                                
                                TextField("Type of Coffee e.g. (Espresso Shot)", text: $options.drinkType)
                                
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
                                            TextField("Creamer Type", text: $options.creamer)
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
                                    TextField("Favorite location to buy.", text: $options.location)

                                    TextField("Extra Comments", text: $options.extraComments)
                                }// extras
                        }
                        HStack{
                            Spacer()
                            Button(action:{
                                drink.temperature = CoffeeOptions.tempTypeOptions[options.tempType]
                                drink.bean = CoffeeOptions.beanTypeOptions[options.beanType]
                                drink.roast = CoffeeOptions.roastLevelOptions[options.roastType]
                                drink.flavor = CoffeeOptions.flavorOptions[options.flavorType]
                                
                                drink.room_for_milk = options.milkToggle
                                drink.milkType = CoffeeOptions.milkTypeOptions[options.milkType]
                                drink.isSteamed = options.isSteamed
                                                    
                                drink.room_for_creamer = options.creamerToggle
                                
                                drink.sugar = CoffeeOptions.sugarOptions[options.sugar]
                                drink.number_of_sugar_packets = options.sugarPackets
                                
                                drink.isFavorite = options.isFavorite
                                
                                if options.sugarToggle == false{
                                    drink.sugar = ""
                                }
                                if options.milkToggle == false{
                                    drink.milkType = ""
                                }
                                if options.creamerToggle == false{
                                    drink.creamer = ""
                                }
                                drink.updateDrink()
                                
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Spacer()
                                Text("Edit Drink")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
            }.navigationBarTitle(Text("Create a Drink"), displayMode: .automatic)
            .onAppear(perform: {
                
                options.tempType = find(options: CoffeeOptions.tempTypeOptions, target: drink.temperature ?? "None") ?? 0
                options.beanType = find(options: CoffeeOptions.beanTypeOptions, target: drink.bean ?? "None") ?? 0
                options.roastType = find(options: CoffeeOptions.roastLevelOptions, target: drink.roast ?? "None") ?? 0
                options.flavorType = find(options: CoffeeOptions.flavorOptions, target: drink.flavor ?? "None") ?? 0
                
                options.drinkType = drink.type ?? ""
                options.drinkName = drink.drinkName ?? ""
                options.extraComments = drink.extraComments ?? ""
                options.location = drink.location ?? ""

                if drink.room_for_milk ?? false{
                    options.milkToggle = drink.room_for_milk ?? false
                    options.milkType = find(options: CoffeeOptions.milkTypeOptions, target: drink.milkType ?? "None") ?? 0
                }
                if drink.room_for_creamer ?? false{
                    options.creamerToggle = drink.room_for_creamer ?? false
                    options.creamer = drink.creamer ?? ""
                }
                if drink.number_of_sugar_packets != 0{
                    options.sugarToggle = true
                    options.sugarPackets = drink.number_of_sugar_packets ?? 0
                }
                
                options.isFavorite = drink.isFavorite ?? false


            })
        }
    }
}

func find(options:[String], target:String) -> Int?{
    if let index = options.firstIndex(of: target) {
        return index
    }
    return 0
}


func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
