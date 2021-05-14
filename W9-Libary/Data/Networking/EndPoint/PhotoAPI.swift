//
//  PhotoAPI.swift
//  W9-Library
//
//  Created by Văn Khánh Vương on 10/05/2021.

import Alamofire

enum PhotoAPI {
    case getPhotos(page: Int)
    case getTopics(page: Int)
    case getTopicsPhotos(slug: String, page: Int)
    case getSearchPhotos(page: Int, keyword: String)
}

extension PhotoAPI: TargetType {
    
    var baseURL: String {
        "https://api.unsplash.com/"
    }
    
    var headers: HTTPHeaders? {
        [
            "Authorization" : "Client-ID 2hg_bOYJk7IhNcRKcB6O8-b7ooJutX1pltxGIritJP4",
            "Content-Type" : "application/json"
        ]
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getPhotos,
             .getTopics,
             .getTopicsPhotos,
             .getSearchPhotos:
            return URLEncoding.default
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getPhotos(let page):
            return [
                "page": page,
                "per_page": 20
            ]
        case .getTopics(let page):
            return [
                "page": page,
                "per_page": 20
            ]
        case .getSearchPhotos(let page, let keyword):
            return [
                "page": page,
                "query": keyword,
                "per_page": 20
            ]
        case .getTopicsPhotos(_, let page):
            return [
                "page": page,
                "per_page": 20
            ]
        }
    }
    
    var path: String {
        switch self {
        case .getPhotos:
            return "phots"                         // Ex: photos?page=1
        case .getTopics:
            return "topics"                         // Ex: topics?page=2
        case .getTopicsPhotos(let slug, _):
            return "topics/\(slug)/photos"          // Ex: topics/wallpapers/photos
        case .getSearchPhotos:
            return "search/photos"                  // Ex: search/photos?page=1&query=office Search by description
        }
    }
    
    var url: URL? {
        guard let url = URL(string: self.baseURL + self.path) else { return nil }
        return url
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getPhotos,
             .getTopics,
             .getTopicsPhotos,
             .getSearchPhotos:
            return .get
        }
    }
}
