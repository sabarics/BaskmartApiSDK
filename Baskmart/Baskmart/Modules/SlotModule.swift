//
//  SlotModule.swift
//  Baskmart
//
//  Created by Zuper on 20/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    public struct Slots{
        
        
        /// Master Slot completion
        public typealias DeliverySlotCompletion = (Result<DeliverySlot?>) -> ()
        
        
        /// All Delivery slots - Master
        /// - Parameter completion: Slot list response
        public static func getAllDeliverySlot(completion: @escaping DeliverySlotCompletion) {
            
            /// Get DeliverySlot url
            let urlString = generateURL(type: wsUrl.deliverySlot)
            
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
                        let response = try! JSONDecoder().decode(DeliverySlot.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        /// Product Slot completion
        public typealias ProductSlotCompletion = (Result<ProductSlots?>) -> ()
        
        
        /// Get product slots
        /// - Parameters:
        ///   - date: Pass selected date
        ///   - productId: ProductId
        ///   - variantId: Product VariantId
        ///   - locality: Location
        ///   - completion: Product Slot response
        public static func getProductDeliverySlot(date:Date,productId:String,variantId:String,locality:String,completion: @escaping ProductSlotCompletion) {
            
            /// Get Product DeliverySlot url
            let urlString = generateURL(type: wsUrl.productSlot) + "\(storeId)&product_id=\(productId)" + "\(ServiceName.productVariantId.rawValue)\(variantId)" + "\(ServiceName.slotDate.rawValue)\(convertSlotDatetoString(date: date))" + "&locality=\(locality)"
            
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
                        let response = try! JSONDecoder().decode(ProductSlots.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        /// Delivery Type Completion
        public typealias DeliveryCompletion = (Result<DeliveryType?>) -> ()
        
        public static func getAvailableDeliveryTypes(completion: @escaping DeliveryCompletion) {
            
            /// Get DeliveryType url
            let urlString = generateURL(type: wsUrl.deliveryType)
            
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
                        let response = try! JSONDecoder().decode(DeliveryType.self, from: jsonData)
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


func convertSlotDatetoString(date: Date) -> String
{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let dateString = dateFormatter.string(from: date)
    return dateString
}
