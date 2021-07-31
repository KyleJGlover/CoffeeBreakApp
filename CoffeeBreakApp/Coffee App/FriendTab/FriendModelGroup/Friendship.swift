//
//  Friendship.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/30/21.
//

import Foundation

struct BecomeFriends: Hashable,  Codable{
    var profile_id: Int
    var friend_id: Int
    var username: String
    var firstName: String
    var lastName: String
    var description: String

    
    enum CodingKeys: String, CodingKey {
        
        case profile_id = "profile_id"
        case friend_id = "friend_id"
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case description
     
    }
          
}
    class FriendOptions: ObservableObject{
        
     
        @Published var add:Bool = false
        @Published var remove: Bool = false
       

        
        func clearFriendOptions(){
     
            self.add = false
            self.remove = false
       
        }

    }
    

  //    init(){
          // Add & Remove
        
//        self.profile_id = 0
//        self.friend_id = 1
 //       self.username = ""
 //       self.firstName = ""
 //       self.lastName = ""
 //       self.description = ""
  //    }
      func addFriend(returnMessage: Message, options: FriendOptions){
              let profile_id = 1
              let friend_id = 2
              guard let url = URL(string:"http://127.0.0.1:5000/friend/add/\(profile_id)/\(friend_id)") else {
                  print("Invalid URL")
                  return }
              
            guard let encoded = try? JSONEncoder().encode(self)
                 else {
                      print("Failed Friendship")
                      return
                  }
              
              var request = URLRequest(url:url)
              request.addValue("application/json", forHTTPHeaderField: "Content-Type")
              request.httpMethod = "POST"
              request.httpBody = encoded
              
              downloadData(request: request) { (returnedData) in
                  if let data = returnedData {
                      guard let message = try? JSONDecoder().decode(Message.self, from: data) else { return }
                      DispatchQueue.main.async {
                         
                          returnMessage.message = message.message
                      }
                  } else {
                      print("No data returned.")
                  }

              }

          }
          
    
      func removeFriend(returnMessage: Message, options: FriendOptions){
          let profile_id = 1
          let friend_id = 2
          guard let url = URL(string:"http://127.0.0.1:5000/friend/delete/\(profile_id)/\(friend_id)") else {
              print("Invalid URL")
              return }
          
              guard let encoded = try? JSONEncoder().encode(self)
              else {
                  print("Falied to encode coffee")
                  return
              }
          
          var request = URLRequest(url:url)
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")
          request.httpMethod = "POST"
          request.httpBody = encoded
          
          downloadData(request: request) { (returnedData) in
              if let data = returnedData {
                  guard let message = try? JSONDecoder().decode(Message.self, from: data) else { return }
                  DispatchQueue.main.async {
                     
                      returnMessage.message = message.message
                  }
              } else {
                  print("No data returned.")
              }

          }

      }
  



    

 

