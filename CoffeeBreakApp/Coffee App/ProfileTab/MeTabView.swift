//
//  MeTabView.swift
//  MyCoffee
//


import SwiftUI

struct MeTabView: View {
    @ObservedObject var friendpeek: Friendpeek
    
    @State private var isModal: Bool = false;
    let stories = ["BMC","Mocha", "Expresso","Frap","Mazagan"]
    let stories2 = ["BMC","Mocha", "Expresso","Frap","Mazagan","ColdBrew","IcedCoffee",
    "Macchiato"]
    var body: some View {

                
        ZStack{
            Color("myCoffeeBlack")
                .ignoresSafeArea()
            
            VStack{
                
                HStack(spacing: 41){
                    
                    Text("CoffeeBreak")
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .foregroundColor(Color(.white))
                    
                   // NavigationLink ( destination: LoginView(friendpeek: self.friendpeek)){
                   // LoginView()
                    
                    VStack{
                        
                        Button("Sign Out") {
                            isModal = true
                    }.sheet(isPresented: $isModal, content: {LoginView()
                            
                        })}
                        .padding(.horizontal).padding(.horizontal)
                    .offset(x:30)
                    
                }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black)            ;
                
                
                HStack(spacing: 15) {
                    HStack(spacing: 15) {
                        Image("animoji3")
                             .resizable()
                             .frame(width: 50, height: 50, alignment: .center)
                             .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                             .cornerRadius(25)
                        Text("Stephen")  .font(.system(size: 25, weight: .bold, design: .default))
                           .foregroundColor(Color(.white));
                        Spacer()
                        }.padding()
                    
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
                                .font(.system(size: 25, weight: .bold, design: .default))
                                   .foregroundColor(Color(.white))
                                .foregroundColor(Color(.white));
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 3){
                                    ForEach(stories, id: \.self){name in
                                    Image(name)
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .frame(width: 140, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .background(Color.black)
                                            .clipped()
                                            Spacer()
                                        }
                                      }
                            };Divider().frame(height: 1).background(Color.black)
                                .offset(y:30)
                            
                         }.offset(y:-20)
            
                            }
                ZStack{
                    Color("black")
                        .ignoresSafeArea()
                                VStack{
                                    Text("All Drinks")
                                        .font(.system(size: 25, weight: .bold, design: .default))
                                           .foregroundColor(Color(.white))
                                        .foregroundColor(Color(.white));
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack(spacing: 3){
                                            ForEach(stories2, id: \.self){name in
                                            Image(name)
                                                .resizable()
                                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                                .frame(width: 140, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .background(Color.black)                                               .clipped()
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
                    
}
            
 
           
            


struct MeTabView_Previews: PreviewProvider {
    @ObservedObject static var friendpeek = Friendpeek (id:0, Name: "stephen", AboutMe: "I like Iced Coffee", Image: "animoji3")
    static var previews: some View {
        MeTabView (friendpeek: friendpeek)
    }
}
