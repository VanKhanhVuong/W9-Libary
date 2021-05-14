//
//  APIClient.swift
//  W9-Libary-Alamofire
//
//  Created by Văn Khánh Vương on 12/05/2021.
//

import Foundation

class APIClient {
    func getTopicFromAPI(page: Int, completionHandler: @escaping (_ result: Result<[Topic], ErrorModel>) -> ()) {
        APIManager.shared.requestApi(type: RequestModel.getTopics(page: page)) { (result: Result<[Topic]?, ErrorModel>) in
            switch result {
            case .success(let topics):
                guard let topic = topics else {
                    completionHandler(.failure(ErrorModel.init(errors: ["No data"])))
                    return
                }
                completionHandler(.success(topic))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }

    func getImageByPage(page: Int, completionHandler: @escaping (_ result: Result<[Photo], ErrorModel>) -> ()) {
        APIManager.shared.requestApi(type: RequestModel.getPhotos(page: page)) { (result: Result<[Photo]?, ErrorModel>) in
            switch result {
            case .success(let photos):
                guard let photo = photos else {
                    completionHandler(.failure(ErrorModel.init(errors: ["No data"])))
                    return
                }
                completionHandler(.success(photo))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }

    func getImageByKeyword(page: Int, keyword: String, completionHandler: @escaping (_ result: Result<PhotoBySearch, ErrorModel>) -> ()) {
        APIManager.shared.requestApi(type: RequestModel.getSearchPhotos(page: page, keyword: keyword)) { (result: Result<PhotoBySearch?, ErrorModel>) in
            switch result {
            case .success(let photos):
                guard let photo = photos else {
                    completionHandler(.failure(ErrorModel.init(errors: ["No data"])))
                    return
                }
                completionHandler(.success(photo))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }

    func getImageByTopic(slug: String, completionHandler: @escaping (_ result: Result<[Photo], ErrorModel>) -> ()) {
        APIManager.shared.requestApi(type: RequestModel.getTopicsPhotos(slug: slug)) { (result: Result<[Photo]?, ErrorModel>) in
            switch result {
            case .success(let photos):
                guard let photo = photos else {
                    completionHandler(.failure(ErrorModel.init(errors: ["No data"])))
                    return
                }
                completionHandler(.success(photo))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

