//
//  MySubscription.swift
//  Baskmart
//
//  Created by Zuper on 21/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    public struct MySubscriptionModule{
        
        
        
        //MySubscription List
        
        /// MySubscription List Completion
        public typealias MySubscriptionListCompletion = (Result<MySubscriptionList?>) -> ()
        
        
        /// Get My Subscription List
        /// - Parameter completion: My Subscription Response
        public static func getMySubscriptionList(completion: @escaping MySubscriptionListCompletion) {
            
            /// Get MySubscription List url
            let urlString = generateURL(type: wsUrl.mySubscriptionList)
            
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
                        let response = try! JSONDecoder().decode(MySubscriptionList.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        /// MySubscription Details Completion
        public typealias MySubscriptionDetailsCompletion = (Result<SubscriptionDetails?>) -> ()
        
        /// Get My Subscription Details
        /// - Parameters:
        ///   - subscriptionId: Pass subscription id to get details
        ///   - completion: My Subscription details Response
        public static func getMySubscriptionDetails(subscriptionId:String,completion: @escaping MySubscriptionListCompletion) {
            
            /// Get MySubscription Details url
            let urlString = generateURL(type: wsUrl.mySubscriptionDetails) + subscriptionId
            
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
                        let response = try! JSONDecoder().decode(MySubscriptionList.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        //Mysubscription History
        public typealias OrderListCompletion = (Result<OrderListResponse?>) -> ()
        
        public static func getMySubscriptionHistory(subscriptionId:String,completion: @escaping OrderListCompletion) {
            
            /// Get MySubscription History url
            let urlString = "\(generateURL(type: wsUrl.orderList))?\(ServiceName.filterCustomerSubscription.rawValue)\(subscriptionId)"
            
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
                        let response = try! JSONDecoder().decode(OrderListResponse.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        //MySubscription Request callout
        //OrderSummaryData
        
        public typealias CalloutDetailsCompletion = (Result<OrderSummaryData?>) -> ()
        
        public static func requestCallOutService(postData:[String:Any],completion: @escaping CalloutDetailsCompletion) {
            
            /// Callout post Url
            let urlString = generateURL(type: wsUrl.requestService)
            
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
                        let response = try! JSONDecoder().decode(OrderSummaryData.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
    }
    
    
    public struct StoreModule{
        
        //MARK:- Get Store Pages
       public typealias StorePagesCompletion = (Result<StorePagesData?>) -> ()
        
        public static func getStorePages(url: String, completion: @escaping StorePagesCompletion)
        {
            let urlStr = url
            
            let encodedUrl = urlStr.addingPercentEncoding(withAllowedCharacters: getCharacterSet())
            guard let url = URL(string: encodedUrl ?? EMPTY) else
                
            {
                completion(.Error(.invalidURL))
                return
            }
            downloader.jsonGetTask(url: url, accesToken: accessToken) { (response) in
                
                switch response
                {
                case .Error(let error):
                    completion(.Error(error))
                    return
                case .ApiError(let apiError):
                    completion(.ApiError(apiError))
                case .Success(let json):
                    if let jsonData = try? JSONSerialization.data(withJSONObject: json)
                    {
                        let products = try! JSONDecoder().decode(StorePagesData.self, from: jsonData)
                        completion(.Success(products))
                    }
                    else
                    {
                        completion(.Error(.jsonParsingFailure))
                    }
                }
                
            }
            
        }
        
        
        //MARK:- Get Servicability Pincode
        public typealias LocationService = (Result<LocationServiceData?>) -> ()
        
        public static func getServiceLocation(completion: @escaping LocationService)
        {
            let urlStr = wsApiUrlValue + ServiceName.allStoreLocation.rawValue + storeId
            
            let encodedUrl = urlStr.addingPercentEncoding(withAllowedCharacters: getCharacterSet())
            guard let url = URL(string: encodedUrl ?? EMPTY) else
                
            {
                completion(.Error(.invalidURL))
                return
            }
            downloader.jsonGetTask(url: url, accesToken: accessToken) { (response) in
                
                switch response
                {
                case .Error(let error):
                    completion(.Error(error))
                    return
                case .ApiError(let apiError):
                    completion(.ApiError(apiError))
                case .Success(let json):
                    if let jsonData = try? JSONSerialization.data(withJSONObject: json)
                    {
                        let products = try! JSONDecoder().decode(LocationServiceData.self, from: jsonData)
                        completion(.Success(products))
                    }
                    else
                    {
                        completion(.Error(.jsonParsingFailure))
                    }
                }
                
            }
            
        }
    }
}



