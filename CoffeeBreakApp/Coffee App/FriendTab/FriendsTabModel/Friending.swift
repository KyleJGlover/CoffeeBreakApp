//
//  Friend.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/5/21.
//

import SwiftUI


// Friend Model....

struct Friending: Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var detail: String
    var image: String
}

// Model Data....

var friends = [

   
    Friending(name: "Kaviya", detail: "0.5 Miles Away", image: "animoji3"),
    Friending(name: "Tom", detail: "3 Miles Away", image: "animoji1"),
    Friending(name: "Oliver", detail: "4 Miles Away", image: "animoji2"),
    Friending(name: "Anna", detail: "1 Miles Away", image: "animoji3"),
  
]
