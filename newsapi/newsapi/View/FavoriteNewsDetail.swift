//
//  FavoriteNewsDetail.swift
//  newsapi
//
//  Created by Irianda on 27/04/21.
//

import SwiftUI

struct FavoriteNewsDetail: View {
  
  @Environment(\.managedObjectContext) var managedObjectContext
  @FetchRequest(entity: FavoriteNews.entity(), sortDescriptors: []) var favoriteNews: FetchedResults<FavoriteNews>
  
  let data: FavoriteNews
  
    var body: some View {
      ScrollView {
         VStack (alignment: .leading){
          WebImage(url: URL(string: data.wrappedImage))
               .resizable()
               .aspectRatio(contentMode: .fit)
               .clipped()
            
            VStack (alignment: .leading, spacing: 20){
              Text(data.wrappedTitle)
                  .font(.title)
                  .fontWeight(.bold)
              Text(data.wrappedDesc)
                  .font(.body)
            }.padding()
         }
      }
    }
}
