//
//  Subscription.swift
//  Baskmart
//
//  Created by Zuper on 21/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

extension BaskmartApi{
    
    public struct SubscriptionModule{
        
        
        /// MaintenancePackage Completion
        public typealias MaintenancePackagesCompletion = (Result<PackageData?>) -> ()
        
        
        /// Get All Maintenance Packages
        /// - Parameter completion: Packages Response
        public static func getAllMaintenancePackages(completion: @escaping MaintenancePackagesCompletion) {
            
            /// Get Package url
            let urlString = generateURL(type: wsUrl.packagesAll)
            
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
                        let response = try! JSONDecoder().decode(PackageData.self, from: jsonData)
                        completion(.Success(response))
                    }
                    else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
        }
        
        
        /// Subscription Details Completion
        typealias MaintenancePackageDetailCompletion = (Result<PackageDetailData?>) -> ()
        
        
        /// Package details
        /// - Parameters:
        ///   - packageId: packageId to get package details
        ///   - completion: Package details response
        public static func getPackagesDetails(packageId:String,completion: @escaping MaintenancePackagesCompletion) {
            
            /// Get Package Details url
            let urlString = generateURL(type: wsUrl.packageDetail) + packageId
            
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
                        let response = try! JSONDecoder().decode(PackageData.self, from: jsonData)
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
