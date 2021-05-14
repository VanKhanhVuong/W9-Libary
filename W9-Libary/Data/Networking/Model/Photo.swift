//
//  Photo.swift
//  W9-Libary-Alamofire
//
//  Created by Văn Khánh Vương on 12/05/2021.
//

import Foundation

struct Photo: Codable {
    var altDescription: String
    var urls: Urls
    
    private enum CodingKeys: String, CodingKey {
        case altDescription = "alt_description"
        case urls = "urls"
    }
}
