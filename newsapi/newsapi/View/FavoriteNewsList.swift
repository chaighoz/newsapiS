//
//  FavoriteNewsList.swift
//  newsapi
//
//  Created by Irianda on 27/04/21.
//

import SwiftUI
//import SDWebImageSwiftUI

struct FavoriteNewsList: View {
  
  @Environment(\.managedObjectContext) var managedObjectContext
  @FetchRequest(entity: FavoriteNews.entity(), sortDescriptors: []) var favoriteNews: FetchedResults<FavoriteNews>
  
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(favoriteNews, id: \.self) { item in
            NavigationLink(destination: FavoriteNewsDetail(data: item)) {
              HStack {
                if item.image != "" {
                  WebImage(url: URL(string: item.wrappedImage)!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 170)
                    .background(Image("loader")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 60, height: 30)
                    )
                    .cornerRadius(10)
                }else {
                  Image("loader")
                     .resizable()
                     .frame(width: 120, height: 170)
                     .cornerRadius(10)
               }
                VStack(alignment: .leading, spacing: 10) {
                   Text(item.wrappedTitle).fontWeight(.bold)
                   Text(item.wrappedDesc).font(.caption)
                      .lineLimit(3)
                      .multilineTextAlignment(.leading)
                }
              }
            }
          }.onDelete(perform: deleteList)
        }
      }.navigationBarTitle(Text("News"))
    }
  }
  
  private func deleteList(at offsets: IndexSet) {
    for index in offsets {
      let favorite = favoriteNews[index]
      managedObjectContext.delete(favorite)
      
      do {
        try managedObjectContext.save()
      }catch {
        print(error)
      }
    }
  }
}

struct FavoriteNewsList_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteNewsList()
  }
}
