//
//  AddMembers.swift
//  CoffeeBreakApp
//
//  Created by Kyle Glover on 6/30/21.
//

class Friend {
    var id: UUID
    var name:String
    var description: String
    var drinkList: [String]
    
    init(){
        self.id = UUID()
        self.name = ""
        self.description = ""
        self.drinkList = [""]
    }
    init (name:String, description:String, drinkList:[String]){
        self.id = UUID()
        self.name = name
        self.description = description
        self.drinkList = drinkList
    }
}

class FriendList: ObservableObject {
    @Published var friendList: [Friend] = []
    
    init (){
        let friend1 = Friend(name:"Barabara", description:"I love coffee", drinkList:["B drink", "BA drink"])
        let friend2 = Friend(name:"Blake", description:"I really love coffee", drinkList:["Glover drink", "Lover drink"])
        let friend3 = Friend(name:"Stephen", description:"I really really love coffee", drinkList:["Steph drink", "steph fav drink"])
        
        self.friendList.append(friend1)
        self.friendList.append(friend2)
        self.friendList.append(friend3)

    }
}




import SwiftUI

struct AddMembers: View {
    
    @State var searchText:String = ""
    @State var isSearching:Bool = false
    
    @ObservedObject var friendList: FriendList = FriendList()
    
    var body: some View {
        ScrollView(.vertical){
            
            SearchFunction(searchText:$searchText, isSearching:$isSearching)
            
            ForEach((0 ..< self.friendList.friendList.count).filter({("\($0)".contains(searchText) || searchText.isEmpty)}), id:\.self) { num in
                    HStack{
                        Text("\(self.friendList.friendList[num].name)")
                            .padding(.leading)
                        Spacer()
                    }.padding()
                    Divider()
                        .background(Color(.systemGray4))
                }
            
//            ForEach(self.friendList.friendList.filter{$0.name.contains(searchText) || searchText.isEmpty}){ num in
//                    HStack{
//                        Text("\(self.friendList.friendList[num].name)")
//                            .padding(.leading)
//                        Spacer()
//                    }.padding()
//                    Divider()
//                        .background(Color(.systemGray4))
//                }
            
        }.navigationBarTitle("Friends List")
        .padding(.top, 30)
    }
}

struct AddMembers_Previews: PreviewProvider {
    static var previews: some View {
        AddMembers()
    }
}

struct SearchFunction: View {
    
    @Binding var searchText:String
    @Binding var isSearching:Bool
    
    var body: some View {
        HStack{
            HStack{
                TextField("Search terms here", text:$searchText)
                    .padding(.leading, 24)
                
            }.padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack{
                    Image(systemName:"magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: { searchText = ""}, label: {
                            Image(systemName:"xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                    
                }.padding(.horizontal, 32)
                .foregroundColor(Color.gray)
                
            ).transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching{
                Button(action: {
                    isSearching = false
                    searchText = ""
                    //resigns the keyboard from it's current task 
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .padding(.leading,  -12)
                        .padding(.trailing)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}
