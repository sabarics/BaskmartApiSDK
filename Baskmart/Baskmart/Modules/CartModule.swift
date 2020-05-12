//
//  CartModule.swift
//  Baskmart
//
//  Created by Zuper on 20/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    public struct Cart{
        
        
        /// CartList Completion
        public typealias CartDetailsCompletion = (Result<CartData?>) -> ()
        
        
        
        /// Get Cart details
        /// - Parameter completion: Cart details response
        public static func getCartDetails(completion: @escaping CartDetailsCompletion) {
            
            /// Get Cart url
            let urlString = generateURL(type: wsUrl.cartList)
            
            let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: getCharacterSet()) ?? EMPTY
            
            ///Check url is valid
            guard let url = URL(string: encodedUrl) else{
                completion(.Error(.invalidURL))
                return
            }
            
            downloader.jsonGetTask(url: url, accesToken: accessToken) { (response) in
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
                    //6 parsing the Json response
                    if let jsonData = try? JSONSerialization.data(withJSONObject: json){
                        let response = try! JSONDecoder().decode(CartData.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        
        /// Cart Update Products - Add, Delete
        /// Discount- Add, Delete
        /// Address- Add, Update
        /// Delivery- Schedule(stat and end time),Express
        /// - Parameters:
        ///   - postData: postData as Dict
        ///   - completion: WishlistResponse
        public static func updateCart(postData:[String:Any],completion: @escaping CartDetailsCompletion) {
            
            /// Get updtae cart url
            let urlString = generateURL(type: wsUrl.postCartList)
            let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: getCharacterSet()) ?? EMPTY
            ///Check url is valid
            guard let url = URL(string: encodedUrl) else{
                completion(.Error(.invalidURL))
                return
            }
            
            downloader.jsonPostTask(url: url, accesToken: accessToken, postData: postData, method: wsPOST) { (response) in
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
                    //6 parsing the Json response
                    if let jsonData = try? JSONSerialization.data(withJSONObject: json){
                        let response = try! JSONDecoder().decode(CartData.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
    }
}
