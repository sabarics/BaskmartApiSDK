//
//  UserModule.swift
//  Baskmart
//
//  Created by Zuper on 19/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    
    /// User
    public struct User {
        
        ///User details completion
        public typealias UseCompletionHandler = (Result<UserDetails?>) -> ()
        
        
        /// Get User Details
        /// - Parameter completion: Get Userdetails response from server
        public static func userDetails(completion: @escaping UseCompletionHandler) {
            
            /// Get userDetails url
            let urlString = generateURL(type: .customerDetails)
            
            ///Check url is valid
            guard let url = URL(string: urlString) else{
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
                        let response = try! JSONDecoder().decode(UserDetails.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        /// Create, Update, Delete Customer address
        /// - Parameters:
        ///   - postData: Post data as Dict
        ///   - completion: UserDetails response
        public static func postUserAddress(postData:[String:Any],completion: @escaping UseCompletionHandler) {
            
            /// Get Add,Update,Deleta address url
            let urlString = generateURL(type: wsUrl.createOrUpdateAddress)
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
                        let response = try! JSONDecoder().decode(UserDetails.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        
        /// Change Password
        /// - Parameters:
        ///   - postData: post data as dict
        ///   - completion: Change password response
        public static func changePassword(postData:[String:Any],completion: @escaping ResponseDict) {
            
            /// Get change password url
            let urlString = generateURL(type: wsUrl.changePassword)
            let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: getCharacterSet()) ?? EMPTY
            ///Check url is valid
            guard let url = URL(string: encodedUrl) else{
                completion(.Error(.invalidURL))
                return
            }
            
            downloader.jsonPostTask(url: url, accesToken: accessToken, postData: postData, method: wsPUT) { (response) in
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
                    completion(.Success(json))
                    
                }
            }
        }
        
        public static func updateUserPhoneNo(postData:[String:Any],completion: @escaping ResponseDict) {
            
            /// Get change password url
            let urlString = generateURL(type: wsUrl.updatePhoneNo)
            let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: getCharacterSet()) ?? EMPTY
            ///Check url is valid
            guard let url = URL(string: encodedUrl) else{
                completion(.Error(.invalidURL))
                return
            }
            
            downloader.jsonPostTask(url: url, accesToken: accessToken, postData: postData, method: wsPUT) { (response) in
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
                    completion(.Success(json))
                    
                }
            }
        }
        
        
        public static func updateUserDetails(postData:[String:Any],completion: @escaping ResponseDict) {
            
            /// Get change password url
            let urlString = generateURL(type: wsUrl.signUp)
            let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: getCharacterSet()) ?? EMPTY
            ///Check url is valid
            guard let url = URL(string: encodedUrl) else{
                completion(.Error(.invalidURL))
                return
            }
            
            downloader.jsonPostTask(url: url, accesToken: accessToken, postData: postData, method: wsPUT) { (response) in
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
                    completion(.Success(json))
                    
                }
            }
        }
        
        /// Update user details
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
                    completion(.Success(json))
                }
            }
        }
    }
}
