//
//  CreateOrder.swift
//  MyCoffee
//
//  Created by Kyle Glover on 6/16/21.
//

import SwiftUI


struct CreateOrder: View {
    @ObservedObject var newOrder = Order()
    
    @State var name = ""
    @State var location = ""
    @State var date = Date()
    var calendar = Calendar.current
    var closedRange: ClosedRange<Date> {
        let currentDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let DaysSevenLater = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
        return currentDate...DaysSevenLater
    }

    
    

    
    var body: some View {
        VStack{
            HStack{
                Text("Order Creation")
                    .font(.title)
                    .padding()
                Spacer()
            }
        
            Form{
                TextField("Group Name", text:$name)
                NavigationLink(destination: MapUserView()){
                    TextField("Location", text:$location)
                }


                DatePicker("Date/Time", selection:$date, in:closedRange)
                    .datePickerStyle(WheelDatePickerStyle())
                    .clipped()
                
                
                Section {
                    Button(action: {
                        createOrder(name: name, location: location, date: date)
                        
                    }) {
                        Text("Create Order")
                            
                            .accentColor(.blue)
                    }
                }
                
                
                

                
            }
        }
    }
    func createOrder(name:String, location:String , date: Date) {
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: date)
//        let minutes = calendar.component(.minute, from: date)
        
        let dateToString = DateFormatter()
        dateToString.dateFormat = "HH:mm E, d MMM y"
        //let orderDate = dateToString.string(from:date)
        
        
        
        
    }
}

struct CreateOrder_Previews: PreviewProvider {
    static var previews: some View {
        CreateOrder()
    }
}
