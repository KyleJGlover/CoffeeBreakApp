
//
//  FriendDetails.swift
//  MyCoffee
//
//  Created by user193062 on 4/28/21.
//

import SwiftUI


struct FriendDetails: View {
    @Binding var Friend: FriendInfo
var body: some View {

        NavigationLink(
            destination: (Details(Friend: $Friend)),
            label: {
                VStack{
                    Text("Details")
                
                Spacer()
            }
       })
        Spacer()
        NavigationLink(
            destination: (Options()),
            label: {
                VStack{
                Text("Top Five Drinks")
                
                Spacer()
        }
      })
    Spacer()
    NavigationLink(
        destination: (Options()),
        label: {
            VStack{
            Text("All Drinks")
            
            Spacer()
        }
     })
    Spacer()
  }
    
    
}

struct AllDrinksOfficial: View{
    var body: some View{
        VStack{
            
        }
    }
}


struct Options: View{
    var body: some View{
        GeometryReader{ geometry in
            VStack{
                ScrollView (.vertical){
                    ForEach(0 ..< 20) { number in
                        VStack{
                            DrinkView()
                                .frame(width: geometry.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .border(Color.black)
                        }
                    }
                }
            }
        }
    }
}
struct DrinkView: View{
    @State var coffeeDrink = ["Expresso": "Iced Expresso",
                           "Frap":"Frappuccino",
                           "Nitro": "Nitro",
                           "BMC": "Banana Milk Coffee",
                           "Mazgran":"Mazagran",
                           "ColdBrew":"Cold Brew",
                           "Macchiato":"Iced Caramel Macchiato",
                           "IcedCoffee":"Caramel Cocoanut Iced Coffee",
                           "Mocha":"Mocha Smoothie"]
    var body: some View{
            
                    VStack (alignment: .leading){
                        Text(coffeeDrink["Expresso"]!)
                            .padding(0)
                            .font(.custom("Helvetica Neue", size: 14))
                            .foregroundColor(.black)
                        Text(coffeeDrink["Frap"]!)
                            .padding(0)
                            .font(.custom("Helvetica Neue", size: 14))
                            .foregroundColor(.black)
                        Text(coffeeDrink["Nitro"]!)
                            .padding(0)
                            .font(.custom("Helvetica Neue", size: 14))
                            .foregroundColor(.black)
                        Text(coffeeDrink["BMC"]!)
                            .padding(0)
                            .font(.custom("Helvetica Neue", size: 14))
                            .foregroundColor(.black)
                        Text(coffeeDrink["Mazgran"]!)
                            .padding(0)
                            .font(.custom("Helvetica Neue", size: 14))
                            .foregroundColor(.black)
                        Text(coffeeDrink["ColdBrew"]!)
                            .padding(0)
                            .font(.custom("Helvetica Neue", size: 14))
                            .foregroundColor(.black)
                        Text(coffeeDrink["Macchiato"]!)
                            .padding(0)
                            .font(.custom("Helvetica Neue", size: 14))
                            .foregroundColor(.black)
                        Text(coffeeDrink["IcedCoffee"]!)
                            .padding(0)
                            .font(.custom("Helvetica Neue", size: 14))
                            .foregroundColor(.black)
                        Text(coffeeDrink["IcedCoffee"]!)
                            .padding(0)
                            .font(.custom("Mocha", size: 14))
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 0)
                    .scaledToFit()
                    .background(Color("myCoffeeTurquoise"))
        }
}
struct Details: View{
    @Binding var Friend: FriendInfo
    var body: some View{
        VStack{
            Text(Friend.AboutMe)
        }
    }
}


    
//struct FriendDetails_Previews: PreviewProvider {
//    @Binding var Friend: FriendInfo
//    static var previews: some View {
//        FriendDetails(Friend:FriendInfo)
//      }
//   }

 

