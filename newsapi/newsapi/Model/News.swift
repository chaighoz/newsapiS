//
//  News.swift
//  newsapi
//
//  Created by Irianda on 20/04/21.
//

import SwiftUI

struct News: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var description: String
}
