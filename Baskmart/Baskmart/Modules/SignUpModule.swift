//
//  SignUpModule.swift
//  Baskmart
//
//  Created by Zuper on 19/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    public struct SignUp {
        
        
        /// SignUp
        /// - Parameters:
        ///   - postData: Post user details as dict
        ///   - completion: get user details
        public static func user(postData:[String:Any],completion: @escaping ResponseDict) {
            
            /// Get SignUp url
            let urlString = generateURL(type: .signUp)
            
            ///Check url is valid
            guard let url = URL(string: urlString) else{
                completion(.Error(.invalidURL))
                return
            }
            
            downloader.jsonPostTask(url: url, accesToken: nil, postData: postData, method: wsPOST) { (response) in
                switch response {
                    
                /// Error like Request failed,jsonConversionFailure,invalid data,jsonParsingFailure.offline
                case .Error(let error):
                    completion(.Error(error))
                    return
                    
                /// Api Error from Server
                case .ApiError(let apiError):
                    completion(.ApiError(apiError))
                    
                    
                /// Susses data from sever
                case .Success(let json):
                    completion(.Success(json))
                }
            }
        }
    }
}
