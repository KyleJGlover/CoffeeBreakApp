//
//  PlaceListView.swift
//  MapTest
//
//  Created by Kyle Glover on 6/23/21.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
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
                            createOrderLocation(name:landmarks.name, title: landmarks.title )
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
    func createOrderLocation(name:String, title:String){
        let locationName: String = name
        let locationTitle: String = title
        print(locationName)
        print(locationTitle)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())]) {}
    }
}
