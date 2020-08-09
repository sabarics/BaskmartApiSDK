//
//  PaymentModule.swift
//  Baskmart
//
//  Created by Zuper on 20/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    public struct Payment{
        
        ///Payment methods
        public typealias PaymentTypeCompletion = (Result<PaymentDetails?>) -> ()
        
        
        public static func getPaymentMethod(completion: @escaping PaymentTypeCompletion) {
            
            /// Get Paymnetmethod url
            let urlString = generateURL(type: wsUrl.paymentMethod)
            
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
                        let response = try! JSONDecoder().decode(PaymentDetails.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        //PendingPayment
        public typealias PendingPaymnetListCompletion = (Result<(CustomerPayment?)>)-> ()
        
        public static func getPendingPaymentList(completion: @escaping PendingPaymnetListCompletion) {
            
            /// Get Pending Payment url
            let urlString = generateURL(type: wsUrl.allPayment)
            
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
                        let response = try! JSONDecoder().decode(CustomerPayment.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        ///PendingPayment Completion
        public typealias PaymentPendingDetailsCompletion = (Result<PendingPaymentDetails?>) -> ()
        
        
        
        /// Get pending payment details
        /// - Parameters:
        ///   - paymentRequestId: paymentRequest Id
        ///   - completion: PendingPaymnet Details Response
        public static func getPendingPaymentDetails(paymentRequestId:String,completion: @escaping PaymentPendingDetailsCompletion) {
            
            /// Get Pending Payment url
            let urlString = generateURL(type: wsUrl.payPartialPaymentDetails) + paymentRequestId
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
                        let response = try! JSONDecoder().decode(PendingPaymentDetails.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        
        /// Place Order(Checkout)
        /// - Parameters:
        ///   - postData: post data as dict.
        ///   - completion: Place Order response
        public static func placeOrder(type:OrderType,postData:[String:Any],completion: @escaping ResponseDict) {
            
            /// Get Place Orderurl
            var urlString = String()
            if type == .product{
                urlString = generateURL(type: wsUrl.placeOrder)
            }
            else if type == .subscription{
                urlString = generateURL(type: wsUrl.buyPackage)
            }
            
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
                    
                    completion(.Success(json))
                }
            }
        }
        
        
        /// Pay Pending Payment
        /// - Parameters:
        ///   - postData: Post data as Dict
        ///   - completion: Pending paymnet response from server
        public static func payPendingPayment(postData:[String:Any],completion: @escaping ResponseDict) {
            
            /// Get Pay Partial Orderurl
            let urlString = generateURL(type: wsUrl.payPartialPayment)
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
                    
                    completion(.Success(json))
                }
            }
        }
        
    }
}
