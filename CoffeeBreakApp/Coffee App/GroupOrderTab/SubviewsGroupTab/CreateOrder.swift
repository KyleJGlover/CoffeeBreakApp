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
    @State var location = "Location"
    @State var date = Date()
    var calendar = Calendar.current
    var closedRange: ClosedRange<Date> {
        let currentDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let SevenDaysLater = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
        return currentDate...SevenDaysLater
    }
    var body: some View {
        VStack{
//            HStack{
//                Text("Order Creation")
//                    .font(.title)
//                    .padding()
//                Spacer()
//            }
        
            Form{
                TextField("Group Name", text:$newOrder.name)
                NavigationLink(destination: MapUserView()){
                    Text(location)
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
        }.navigationBarColor(backgroundColor: .white, titleColor: .black)
        .navigationBarTitle("Create Your Order")
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
