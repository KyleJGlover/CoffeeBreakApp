//
//  profile.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/5/21.
//

import SwiftUI

class Add: ObservableObject {
    @Published var text: String = "Add Friend"
    
    func getData(){
      downloadData{ [weak self] (returnedData) in
           
        self?.text = returnedData
            
        }
    }
    
    func downloadData(completionHandler: @escaping (_ data: String) -> Void)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        completionHandler("Friend Added")
            
        }
    }
}

class Remove: ObservableObject {
    @Published var text: String = "Remove"
    
    func getData(){
      downloadData{ [weak self] (returnedData) in
           
        self?.text = returnedData
            
        }
    }
    
    func downloadData(completionHandler: @escaping (_ data: String) -> Void)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        completionHandler("Friend Removed")
            
        }
    }
}
struct profile: View {
    @ObservedObject var friendpeek: Friendpeek
    
    @StateObject var addFriends = Add()
    
    @StateObject var removeFriends = Remove()
    
    @State private var isModal: Bool = false;
    let stories = ["BMC","Mocha", "Expresso","Frap","Mazagan"]
    let stories2 = ["CoffeeCupTabIcon", "Mocha", "Expresso","Frap","Mazagan","ColdBrew","IcedCoffee",
    "Macchiato"]
    
    var body: some View {

    VStack{
        ZStack{
            Color("myCoffeeBlack")
                .ignoresSafeArea()
            
        VStack{
            
            HStack(spacing: 76){
                
                Text("CoffeeBreak")
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .foregroundColor(Color(.white))
                    
                
            VStack{
                
                Image("CoffeeBreakIcon")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .topTrailing)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .cornerRadius(25)
                } .padding(.horizontal)
            .offset(x:25)
                
            }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.black);
            
            
            HStack(spacing: 15) {
                HStack(spacing: 15) {
                    Image("animoji1")
                         .resizable()
                         .frame(width: 50, height: 50, alignment: .center)
                         .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                         .cornerRadius(25)
                    Text("Stephen")  .font(.system(size: 25, weight: .bold, design: .default))
                       .foregroundColor(Color(.white));
                    Spacer()
                                       
                    //add
                    Text(addFriends.text)
                        .fontWeight(.none)
                        .font(.body)
                        .padding(9)
                        .background(Color.green)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                        //.padding(1)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.green, lineWidth: 5)
                        )
                     .border(Color.green)
                        .onTapGesture {
                            addFriends.getData()
                        }
                        
                    
                    
                   //remove
                    Text(removeFriends.text)
                        
                        
                        
                        .fontWeight(.none)
                        .font(.body)
                        .padding(9)
                        .background(Color.red)
                        .cornerRadius(1)
                        .foregroundColor(.white)
                        //.padding(1)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.red, lineWidth: 5)
                        )
                    .border(Color.red)
                        .onTapGesture {
                            removeFriends.getData()
                        }
                }.padding(1)
                
                
            }
           
            
            VStack{
                
                Text(friendpeek.AboutMe)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.white));
               
            }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            //.offset(y:10)
            ;Divider().frame(height: 1).background(Color.black)
                //.offset(y:35)
            
    ZStack{
        Color("black")
            //.ignoresSafeArea()
                     VStack{
                        Text("Top 5")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(.white));
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 3){
                                ForEach(stories, id: \.self){name in
                                Image("CoffeeCupTabIcon")
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 140, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .background(Color.gray)
                                        .clipped()
                                        Spacer()
                                    }
                                  }
                        };Divider().frame(height: 1).background(Color.black)
                            .offset(y:30)
                        
                     }
        
        
                        }
            ZStack{
                Color("black")
                    .ignoresSafeArea()
                            VStack{
                                Text("All Drinks")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color(.white));
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack(spacing: 3){
                                        ForEach(stories2, id: \.self){name in
                                        Image("CoffeeCupTabIcon")
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .frame(width: 140, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .background(Color.gray)                                               .clipped()
                                                Spacer()                     }
                                                                        
                                            }
                                        Spacer()
                                        
                                    }
                                  
                                }
                
                            }.background(Color("myCoffeeControlColor"))
            
                    }.background(Color("myCoffeeControlColor"))
        //Divider().frame(height: 1).background(Color.black)
            //.offset(y:40)
            
                }
            }
            
   // func placeOrder(){
  //  guard let encoded = try? JSONEncoder().encode(order)
    //    else {
    //        print ("failed")
     //       return
    
       // }
   }

}

struct profile_Previews: PreviewProvider {
    @ObservedObject static var friendpeek = Friendpeek (id:0, Name: "stephen", AboutMe: "I like Iced Coffee", Image: "animoji3")
    static var previews: some View {
        profile(friendpeek: friendpeek)
    }
}

