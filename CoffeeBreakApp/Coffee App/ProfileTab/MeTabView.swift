//
//  MeTabView.swift
//  MyCoffee
//
//  Created by Juan Hernandez on 4/21/21.
//

import SwiftUI

struct MeTabView: View {
    @State var name = "Juan Hernandez"
    @State var display_name = "BlindWiz"
    @State var about_me = "I love coffee, like I really do.  I drink it all day."

    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    Section(header: Text("About Me")) {
                        Text("\(name)")
                        Text("Display Name: \(display_name)")
                        Button("Edit Profile") {}
                    }
                    Section(header: Text("My Coffees")) {
                        List {
                            ForEach(1..<15) {(x) in
                            Text("My awesome coffee \(x)")
                        }
                    }
                }
                    Section(header: Text("About Me")) {
                        Text("\(about_me)")
                    }
                }
                
            } // end form
            .navigationTitle("My Profile")
        } // end NavigationView
    }
}

struct MeTabView_Previews: PreviewProvider {
    static var previews: some View {
MeTabView()
    }
}

