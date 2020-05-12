//
//  OrderModule.swift
//  Baskmart
//
//  Created by Zuper on 20/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation


extension BaskmartApi{
    
    public struct Order{
        
        /// Order list response
        public typealias OrderListCompletion = (Result<OrderListResponse?>) -> ()
        
        
        /// Get Order List
        /// - Parameter completion: OrderList Completion
        public static func getOrderList(completion: @escaping OrderListCompletion){
            
            /// Get Order list url
            let urlString = generateURL(type: wsUrl.orderList)
            
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
        
        
        
        
        /// Get Order details by OrderId
        /// - Parameters:
        ///   - orderId: OrderId
        ///   - completion: Order Details Response(Same as order list response, take the 1st object from array)
        public static func getOrderDetails(orderId:String,completion: @escaping OrderListCompletion){
            
            /// Get Order list url
            let urlString = generateURL(type: wsUrl.orderList) + "filter.order_id=\(orderId)"
            
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
        
        /// TrackOrder Completion
        public typealias TrackOrderCompletion = (Result<TrackOrderData?>) -> ()
        
        
        
        /// Track Order Details
        /// - Parameters:
        ///   - orderId: OrderId
        ///   - completion: Track order details
        public static func trackOrder(orderId:String,completion: @escaping TrackOrderCompletion){
            
            /// Get Track order url
            let urlString = generateURL(type: wsUrl.trackOrder) + "\(orderId)"
            
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
                        let response = try! JSONDecoder().decode(TrackOrderData.self, from: jsonData)
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
