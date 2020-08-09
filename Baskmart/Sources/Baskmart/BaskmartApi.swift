//
//  ZuperApi.swift
//  BasicSampleFramework
//
//  Created by apple on 31/01/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import Foundation
import UIKit


/// BaskmartApi Api
public struct BaskmartApi {
    
    
    /// Create shared instance for ZuperApi struct
    public static let shared = BaskmartApi()
    /// Create instance for webservice wrapper
    public static let downloader = WebServiceWrapper()
    
    /// Common Server response
    public typealias ResponseDict = (Result<[String: AnyObject]>) -> ()
    
    
    
    //MARK:- Slider
    /// Slider response
    public typealias sliderResponse = (Result<SliderData?>) -> ()
    
    /// Get Slider List
    /// - Parameter completion: Slider response
    public static func getSliderList(completion: @escaping sliderResponse) {
        
        /// Get userDetails url
        let urlString = generateURL(type: .slider)
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
                    let response = try! JSONDecoder().decode(SliderData.self, from: jsonData)
                    completion(.Success(response))
                }
                else{
                    completion(.Error(.jsonParsingFailure))
                }
            }
        }
    }
    //MARK:- Product Groups, Best seller, Top deals
    /// ProductGroup  response
    public typealias productGroupResponse = (Result<BestSellersData?>) -> ()
    
    /// ProductGroup
    /// - Parameter completion: ProductGroup response
    public static func getProductGroup(type:ProductGroup,completion: @escaping productGroupResponse) {
        
        /// Get ProductGroup url
        var urlString: String = EMPTY
        
        if type == .bestSeller{
            urlString = generateURL(type: .bestSeller)
        }else if type == .topDeal{
            urlString = generateURL(type: .topDeal)
        }else if type == .productCollection{
            urlString = generateURL(type: .productCollection)
        }
        
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
                    let response = try! JSONDecoder().decode(BestSellersData.self, from: jsonData)
                    completion(.Success(response))
                }
                else{
                    completion(.Error(.jsonParsingFailure))
                }
            }
        }
    }
    
    //MARK:- Wishlist
    /// wishList response
    public typealias WishlistCompletion = (Result<WishListData?>) -> ()
    
    /// Get WishList List
    /// - Parameter completion: Slider response
    public static func getWishList(completion: @escaping WishlistCompletion) {
        
        /// Get userDetails url
        let urlString = generateURL(type: .wishList)
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
                    let response = try! JSONDecoder().decode(WishListData.self, from: jsonData)
                    completion(.Success(response))
                }
                else{
                    completion(.Error(.jsonParsingFailure))
                }
            }
        }
    }
    
    
    /// Wishlist Add/Remove
    /// - Parameters:
    ///   - postData: postData as Dict
    ///   - completion: WishlistResponse
    public static func updateWishList(postData:[String:Any],completion: @escaping ResponseDict) {
        
        /// Get userDetails url
        let urlString = generateURL(type: wsUrl.postWishList)
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
    
    
    //MARK:- Category
    
    /// wishList response
    public typealias ProductCategoriesCompletion = (Result<ProductCategoryData?>) -> ()
    
    /// Get All category List
    /// - Parameter completion: Product category response
    public static func getCategoryList(completion: @escaping ProductCategoriesCompletion) {
        
        /// Get userDetails url
        let urlString = generateURL(type: .categories)
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
                    let response = try! JSONDecoder().decode(ProductCategoryData.self, from: jsonData)
                    completion(.Success(response))
                }
                else{
                    completion(.Error(.jsonParsingFailure))
                }
            }
        }
    }
    
    /// Get All child category from category id
    /// - Parameters:
    ///   - categoryId: Category Id
    ///   - completion: Child category response
    public static func getChildCategoryList(categoryId:String,completion: @escaping ProductCategoriesCompletion) {
        
        /// Get userDetails url
        let urlString = wsApiUrlValue + ServiceName.productCategories.rawValue + "?parent_category_id=\(categoryId)" + ServiceName.storeId.rawValue + storeId
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
                    let response = try! JSONDecoder().decode(ProductCategoryData.self, from: jsonData)
                    completion(.Success(response))
                }
                else{
                    completion(.Error(.jsonParsingFailure))
                }
            }
        }
    }
}


public enum ProductGroup:String{
    case bestSeller = "BestSeller"
    case topDeal = "TopDeal"
    case productCollection = "ProductCollection"
}

