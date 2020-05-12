//
//  ProductModule.swift
//  Baskmart
//
//  Created by Zuper on 19/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    public struct Product{
        
        //MARK:- ProductsList
        
        ///ProductList Completion
        public typealias ProductListCompletion = (Result<AllProducts?>) -> ()
        
        
        /// Get All Product List from categoryId
        /// - Parameters:
        ///   - categoryId: CategoryIds - Parent category id
        ///   - completion: Product List response
        public static func getProductList(categoryId:String,completion: @escaping ProductListCompletion) {
            
            /// Get ProductList url
            let urlString = wsApiUrlValue + ServiceName.allProducts.rawValue + "&filter.product_category_id=\(categoryId)" + ServiceName.storeId.rawValue + storeId
            
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
                        let response = try! JSONDecoder().decode(AllProducts.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        ///Product by CategoryList Completion
        public typealias ProductSectionListCompletion = (Result<AllCategoryProducts?>) -> ()
        
        
        /// Get All Product List from categoryIds(Child category ids). Which is products grouped by category
        /// - Parameters:
        ///   - categoryIds: ChildCategory ids
        ///   - completion: Product List response
        public static func getProductSectionList(categoryIds:String,completion: @escaping ProductSectionListCompletion) {
            
            /// Get Product Catagerory section url
            let urlString = wsApiUrlValue + ServiceName.allProducts.rawValue + "&filter.category_ids=\(categoryIds)" + ServiceName.storeId.rawValue + storeId
            
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
                        let response = try! JSONDecoder().decode(AllCategoryProducts.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        //MARK:- ProductsDetails
        
        /// Get Products from productId
        /// - Parameters:
        ///   - productId:ProductId
        ///   - completion: Product List response
        public static func getProductDetails(productId:String,completion: @escaping ProductListCompletion) {
            
            /// Get ProductDetails url
            let urlString = wsApiUrlValue + "customer/store/product/all?offset=1&limit=1" + "&filter.product_id=\(productId)" + ServiceName.storeId.rawValue + storeId
            
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
                        let response = try! JSONDecoder().decode(AllProducts.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        //MARK:- Products - Search
       public typealias GetAllProductsCompletion = (Result<AllProducts?>) -> ()
        
        public static func getAllProducts(url: String, completion: @escaping GetAllProductsCompletion)
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
                        let products = try! JSONDecoder().decode(AllProducts.self, from: jsonData)
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
