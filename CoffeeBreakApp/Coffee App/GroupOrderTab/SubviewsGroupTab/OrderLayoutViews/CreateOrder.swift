//
//  CreateOrder.swift
//  MyCoffee
//
//  Created by Kyle Glover on 6/16/21.
//

import SwiftUI


struct CreateOrder: View {
    @ObservedObject var newOrder = Order()

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
        
//            Form{
//                TextField("Group Name", text:$newOrder.name)
//                    .padding(.top)
//                    .padding(.bottom)
//                NavigationLink(destination: MapUserView(newOrder: self.newOrder)){
//                    VStack{
//                        Text(newOrder.location)
//                        Text(newOrder.address)
//                    }
//                }.padding(.top)
//                DatePicker("Date/Time", selection:$date, in:closedRange)
//                    .datePickerStyle(WheelDatePickerStyle())
//                    .clipped()
//                
//                NavigationLink(destination: AddMembers()){
//                    ForEach(0 ..< newOrder.members.count) { num in
//                        VStack{
//                            Text(newOrder.members[num])
//                        }
//                    }
//                }.padding(.top)
//                .padding(.bottom)
//                
//                Section {
//                    HStack{
//                    Spacer()
//                        Button(action: {
//                            createOrder(newOrder: newOrder, date: date)
//                        }) {
//                            Text("Create Order")
//                                .accentColor(Color.blue)
//                            
//                        }
//                    Spacer()
//
//                    }
//                    
//                }
//            }
        }
        .navigationBarTitle("Order Details")
    }
    func createOrder(newOrder: Order, date: Date) {
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
