//
//  Article.swift
//  GoodNews
//
//  Created by Natalia Goyes on 3/03/23.
//

import Foundation

struct Headlines: Decodable {
    let articles: [Article]
}


struct Article: Decodable {
    let title: String
    let description: String?
}
