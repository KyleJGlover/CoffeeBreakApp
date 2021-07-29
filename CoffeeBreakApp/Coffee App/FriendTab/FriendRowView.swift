//
//  FriendRowView.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/5/21.
//

import SwiftUI

struct FriendRowView: View {
    @ObservedObject var friendpeek: Friendpeek
    var body: some View {
        
        HStack(spacing: 15){
            
            Image(friendpeek.Image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8, content: {
                
                Text(friendpeek.Name)
                    .fontWeight(.bold)
                
                Text(friendpeek.AboutMe)
                    .font(.caption)
                    .foregroundColor(.gray)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            
                        
        }
        .padding(.horizontal)
    }
}

struct FriendRowView_Previews: PreviewProvider {
    @ObservedObject static var friendpeek = Friendpeek (id:0, Name: "stephen", AboutMe: "I like Iced Coffee", Image: "animoji1")

    static var previews: some View {
        FriendContentView(friendpeek: friendpeek)
    }
}

