//
//  FriendOptionModel.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/30/21.
//

import Foundation

class FriendOptions: ObservableObject{
    
 
    @Published var add:Bool = false
    @Published var remove: Bool = false
   

    
    func clearFriendOptions(){
 
        self.add = false
        self.remove = false
   
    }

}

