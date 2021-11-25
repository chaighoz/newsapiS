//
//  ContentView.swift
//  newsapi
//
//  Created by Irianda on 20/04/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NewsList()
      .tabItem {
        Image(systemName: "house.fill")
        Text("News")
      }
    
    FavoriteNewsList()
      .tabItem {
        Image(systemName: "heart.fill")
        Text("Favorite")
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
