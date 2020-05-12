//
//  LoginModule.swift
//  Baskmart
//
//  Created by Zuper on 13/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    public struct Login{
        
        
        /// Create typealies for api response as [String:Any]
        public typealias LoginResponse = (Result<CustomerDetails?>) -> ()
        
        /// Login User
        /// - Parameters:
        ///   - loginType: Mail,Social
        ///   - postData: Pass user details as Dict
        ///   - completion: Get user details with authentication access token
        public static func userLogin(loginType:LoginType,postData:[String:Any],completion: @escaping LoginResponse) {
            
            /// Get Login url from loginType
            let urlString = getLoginUrl(type: loginType)
            
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
                    if let jsonData = try? JSONSerialization.data(withJSONObject: json)
                    {
                        let response = try! JSONDecoder().decode(CustomerDetails.self, from: jsonData)
                        completion(.Success(response))
                    }
                        
                    else
                    {
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
            
        }
        
        /// Generate OTP
        /// - Parameters:
        ///   - loginType: OTP
        ///   - postData: pass user phone number
        ///   - completion: get dict as response from server
        public static func generateOTP(loginType:LoginType,postData:[String:Any],completion: @escaping ResponseDict) {
            
            
            /// Get opt url from loginType
            let urlString = getLoginUrl(type: loginType)
            
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
        
        public static func forgetPassword(postData:[String:Any],completion: @escaping ResponseDict) {
            
            /// Get ForgetPassword url
            let urlString = generateURL(type: wsUrl.resetPassword)
            
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
        
        public static func resetPasswordCode(postData:[String:Any],completion: @escaping ResponseDict) {
               
               /// Get ForgetPassword url
               let urlString = generateURL(type: wsUrl.resetCode)
               
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

extension BaskmartApi{
    public func convertCartObjToProductObj(obj: ProductCartData) -> ProductData{
        
        let productData = ProductData(productSEO: obj.productSEO, commonTax: obj.commonTax, quantity: obj.quantity, trackQuantity: obj.trackQuantity, alertStockQuantity: obj.alertStockQuantity, commonStock: obj.commonStock, commonPrice: obj.commonPrice, productTags: obj.productTags, isAvailable: obj.isAvailable, isDeleted: obj.isDeleted, productVariantsOptions: obj.productVariantsOptions, locationStock: obj.locationStock, id: obj.productId, storeID: obj.storeID, name: obj.name, urlSlug: obj.urlSlug, productId: obj.productId, selectedQuantity: obj.selectedQuantity, productCategoryID: nil, parentSku: obj.parentSku, productDescription: obj.productDescription, displayImage: obj.displayImage, sellingPrice: obj.sellingPrice, productMetaDatas: obj.productMetaDatas, productVariant: obj.productVariant, taxes: obj.taxes, availability: obj.availability, createdAt: obj.createdAt, updatedAt: obj.updatedAt, v: obj.v, comparedPrice: obj.comparedPrice,deliveryDate: obj.deliveryDate ?? EMPTY,deliveryData: obj.deliveryData,selectedVariantId: obj.selectedVariant ?? EMPTY)
        
        return productData
    }
    
    
    public func getSlotObj(isActive:Bool,id:String,startTime:String,endTime:String, cutOffTime:String,isSelected:Bool) -> Slot{
        return Slot(isActive: isActive, id: id, startTime: startTime, endTime: endTime, cutoffTime: cutOffTime,isSelected: isSelected)
    }
    
    public func getDeliveryObj(day: String, startTime: String, endTime: String, type: String?, deliveryCost: Double?, isDeleted: Bool?, isHoliday: Bool?, deliveryType: String) -> DeliveryData
    {
       return DeliveryData(day: day, startTime: startTime, endTime: endTime, type: type, deliveryCost: deliveryCost, isDeleted: isDeleted, isHoliday: isHoliday, deliveryType: deliveryType)
    }
}
