//
//  PlaceListView.swift
//  MapTest
//
//  Created by Kyle Glover on 6/23/21.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    @ObservedObject var newOrder: Order
    
    let landmarks: [Landmark]
    var onTap: () -> ()
//    @State var drinkLocation: String
//    @State var locationName: String
    
    
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(Color.gray)
            .gesture(TapGesture()
                        .onEnded(self.onTap)
            )
            
            List {
                ForEach(self.landmarks, id:\.id) { landmarks in
                    VStack (alignment: .leading){
                        Button(action: {
                            createOrderLocation(name:landmarks.name, title: landmarks.title, newOrder: newOrder)
                        }){
                            Text(landmarks.name)
                                .fontWeight(.bold)
                            Text(landmarks.title)
                        }
                    }
                }
            }.animation(nil)
        }.cornerRadius(10)
        
        
    }
    func createOrderLocation(name:String, title:String, newOrder: Order){
        newOrder.location = name
        newOrder.address = title
        print(newOrder.location)
        print(newOrder.address)
    }
}

//struct PlaceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], ) {}
//    }
//}
