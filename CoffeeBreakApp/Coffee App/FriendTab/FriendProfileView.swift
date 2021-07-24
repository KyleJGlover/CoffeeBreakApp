//
//  FriendProfileView.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/5/21.
//

import SwiftUI

class Friendpeek: ObservableObject  {

    var id: Int
    
    @Published var Name: String
    @Published var AboutMe: String
    @Published var Image: String

init(){
    self.id = 0
    
    self.Name = ""
    self.AboutMe = ""
    self.Image = ""
}

init(id:Int, Name:String, AboutMe:String,  Image:String ){
    self.id = id
    
    self.Name = Name
    self.AboutMe = AboutMe
    self.Image = Image
    }
    
}

struct FriendProfileView: View {
    @ObservedObject var friendpeek: Friendpeek

    var body: some View {
        NavigationView {
            ZStack{
                 ScrollView{
                        VStack{
                            NavigationLink ( destination: profile (friendpeek: self.friendpeek)){
                                Home(friendpeek: friendpeek)
                                    
                            
                        }
                    }
                }
            }
        }
    }
}



struct FriendProfileView_Previews: PreviewProvider {
    @ObservedObject static var friendpeek = Friendpeek (id:0, Name: "stephen", AboutMe: "I like Iced Coffee", Image: "animoji1");
    static var previews: some View {
        Group{
        FriendProfileView(friendpeek: friendpeek)
            
        }
    }
}
