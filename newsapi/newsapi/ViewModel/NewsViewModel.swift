//
//  NewsViewModel.swift
//  newsapi
//
//  Created by Irianda on 20/04/21.
//

import Foundation
import SwiftyJSON

class NewsViewModel: ObservableObject {
   @Published var data = [News]()
   
   init() {
      let url = "https://newsapi.org/v2/everything?q=apple&from=2021-04-19&to=2021-04-19&sortBy=popularity&apiKey=e11aa6f25a89461ca852f7cc084692c0" //pengambilan API
      
      let session = URLSession(configuration: .default) //langkah ke dua
      session.dataTask(with: URL(string: url)!) { (data, _, error) in
         if error != nil {
            print((error?.localizedDescription)!)
            return
         }
         
         let json = try! JSON(data: data!)
         let items = json["articles"].array!
         
         for i in items {
            let title = i["title"].stringValue
            let image = i["urlToImage"].stringValue
            let description = i["description"].stringValue
            
            DispatchQueue.main.async {
               self.data.append(News(title: title, image: image, description: description))
            }
         }
         
      }.resume() //langkah ke 4

   }
}

