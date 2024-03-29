//
//  MapView.swift
//  MyCoffee
//
//  Created by Kyle Glover on 6/21/21.
//

import MapKit
import SwiftUI

struct MapUserView: View {
    
    @ObservedObject var newOrder: Order

    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks: [Landmark] = [Landmark]()
    @State var location: String = ""
    @State private var tapped: Bool = false
    
    private func getNearByLandmarks(){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = location
        
        let search = MKLocalSearch(request: request)
        search.start {
            (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark:$0.placemark)
                }
            }
        }
    }
    
    func calculateOffset() -> CGFloat {
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 3
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack (alignment: .top){
            
            MapView(landmarks: landmarks)
                .ignoresSafeArea()
            
            TextField("Search", text: $location, onEditingChanged:{
                _ in })
            {
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
//            .offset(y: -0)
            
            PlaceListView(newOrder: self.newOrder, landmarks: self.landmarks) {
                // do something
                self.tapped.toggle()
            }.animation(.spring())
            .offset(y: calculateOffset())
        }.navigationBarTitle("")
    }
}

struct MapUserView_Previews: PreviewProvider {
    
    @ObservedObject static var newOrder: Order = Order()
    
    static var previews: some View {
        MapUserView(newOrder: newOrder)
    }
}
