//
//  CoffeeOptionsModel.swift
//  CoffeeBreakApp
//
//  Created by Kyle Glover on 7/28/21.
//

import Foundation

class CoffeeOptions: ObservableObject{
    
    static let tempTypeOptions:[String] = ["Hot", "Cold"]
    
    static let beanTypeOptions:[String] = ["Arabica", "Robusta"]
    static let roastLevelOptions:[String] = ["Light", "Medium", "Dark"]
    static let flavorOptions:[String] = ["None", "Salted Caramel", "Chocolate", "Dark Chocolate", "Pumpkin Spice", "Hazelnut", "Vanilla", "French Vanilla"]
    
    static let milkTypeOptions:[String] = ["Soy Milk", "Almond Milk", "Oat Milk", "Rice Milk", "Coconut Milk", "Oat Milk", "Skim Milk", "Cashew Milk"]
    static let sugarOptions:[String] = ["White Sugar", "Brown Sugar", "Raw Sugar", "Turbinado", "Honey", "Stevia", "Artificial Sweeteners"]
    
    @Published var tempType:Int = 0
    @Published var beanType:Int = 0
    @Published var roastType:Int = 0
    @Published var flavorType:Int = 0
    @Published var milkType:Int = 0
    @Published var sugar:Int = 0
    
    @Published var sugarPackets:Int = 0
    
    @Published var isSteamed:Bool = false
    
    @Published var milkToggle: Bool = false
    @Published var creamerToggle: Bool = false
    @Published var sugarToggle: Bool = false
    @Published var isFavorite: Bool = false
    
    @Published var drinkType:String = ""
    @Published var drinkName:String = ""
    @Published var location:String = ""
    @Published var extraComments:String = ""
    @Published var creamer:String = ""

    
    func clearOptions(){
        self.tempType = 0
        self.beanType = 0
        self.roastType = 0
        self.flavorType = 0
        self.milkType = 0
        self.sugar = 0
        
        self.sugarPackets = 0
        
        self.isSteamed = false
        
        self.milkToggle = false
        self.creamerToggle = false
        self.sugarToggle = false
        self.isFavorite = false
    }

}


