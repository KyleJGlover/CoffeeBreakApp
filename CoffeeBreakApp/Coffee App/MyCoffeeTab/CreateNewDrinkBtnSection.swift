import SwiftUI

struct CreateNewDrinkBtnSection: View{
    var body: some View{
        VStack (alignment:.center){
            Spacer()
            HStack{
                Spacer()
                NavigationLink(
                    destination: CreateNewDrinkView(),
                        label: {
                            Spacer()
                            Text(" Create New Drink! ")
                                .font(.system(size: 24, weight: .medium, design: .default))
                                .frame(minWidth:0, maxWidth:.infinity)
                                .foregroundColor(Color("myCoffeeWhiteSnow"))
                                .background(Color.black)
                                .border(Color.white)
                            Spacer()
                        })
            }
        }
    }
}

struct CreateNewDrinkView: View{
    
    @State var coffeeDrink = ["tempType": "Temperature Type",
                           "beanType":"Bean Type",
                           "coffeeType": "Coffee Type",
                           "roastLevel": "Roast Level",
                           "milkType":"Milk Type",
                           "milkFat":"Milk Fat"]
    
    @State var drinkName = ""
    
    var body:some View{
        VStack(alignment: .trailing){
                Form{
                    Section(footer: Text("please enter all information above before pressing save")){
                        TextField("Drink Name", text: $drinkName)
                        DropDownView(coffeeDrink: self.$coffeeDrink)

                    }
                    Text("Submit")
                }
                
                    
            }.frame(maxWidth:.infinity, alignment: .leading)
    }
}

struct DropDownView: View{
    @Binding var coffeeDrink: [String:String]
    
    @State var expandedBool:[String:Bool] = ["tempType":false,
                                         "beanType":false,
                                         "roastLevel":false,
                                         "coffeeType":false,
                                         "milkType":false,
                                         "milkFat":false]


    func createGroupBoxMenu(array:[String], type:String) -> some View{
        GroupBox {
            DisclosureGroup(coffeeDrink[type] ?? "", isExpanded: $expandedBool[type].unwrap()!) {
                ForEach(0 ..< array.count) { number in
                    Text(array[number])
                        .frame(maxWidth:.infinity)
                        .onTapGesture {
                            coffeeDrink[type] = array[number]
                            withAnimation{
                                expandedBool[type]?.toggle()
                            }
                        }
                }
            }
        }
    }

    
    var body: some View{
        
        let tempTypeOptions = ["Hot", "Cold"]
        let beanTypeOptions = ["Bean Type", "Arabica", "Robusta"]
        let roastLevelOptions = ["Roast Level", "Light", "Medium", "Dark"]
        let coffeeTypeOptionsHot = ["Coffee Type", "Black Coffee", "Espresso", "Latte", "Cappucino", "Americano", "Mocha"]
        let coffeeTypeOptionsCold = ["Coffee Type", "Cold Brew","Iced Black Coffee", "Iced Latte", "Iced Mocha", "Iced Americano"]
        let milkTypeOptions = ["Milk Type","Soy", "Almond", "Oat", "Rice", "Coconut", "Oat"]
        let milkFatOptions = ["Milk Fat", "Whole", "1%", "2%", "3%"]

        createGroupBoxMenu(array: tempTypeOptions, type: "tempType")
        createGroupBoxMenu(array: beanTypeOptions, type: "beanType")
        createGroupBoxMenu(array: roastLevelOptions, type: "roastLevel")
        createGroupBoxMenu(array: coffeeTypeOptionsHot, type: "coffeeType")
        createGroupBoxMenu(array: coffeeTypeOptionsCold, type: "coffeeType")
        createGroupBoxMenu(array: milkTypeOptions, type: "milkType")
        createGroupBoxMenu(array: milkFatOptions, type: "milkFat")
    }
}
extension Binding {
    func unwrap<Wrapped>() -> Binding<Wrapped>? where Optional<Wrapped> == Value {
        guard let value = self.wrappedValue else { return nil }
        return Binding<Wrapped>(
            get: {
                return value
            },
            set: { value in
                self.wrappedValue = value
            }
        )
    }
}


struct CreateNewDrinkBtnSection_Previews: PreviewProvider {
    static var previews: some View {
        MyCoffeeTabView()
    }
}

