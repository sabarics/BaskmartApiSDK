//
//  Configuration.swift
//  BasicSampleFramework
//
//  Created by apple on 31/01/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation


/// Zuper class
public class Baskmart {
    
    
    /// Set parent url
    /// - Parameter url: url string
    public static func setRootEndPoint(url:String){
        wsApiUrlValue = url
    }
    
//    /// Configure the endpoint
//    /// - Parameter type: Staging/Production
//    public static func configureEndPoint(type:EndPoint){
//        endpointType = type
//        setRootEndpoint()
//    }
    
    /// Set Store id
    /// - Parameter id: storId
    public static func setStoreId(id:String){
        storeId = id
    }
    
    /// Set access token to access Baskmart api
    /// - Parameter token: accessToken
    public static func setAccessToken(token:String){
        accessToken = token
    }
}

/// Endpoints enum
public enum EndPoint:String{
    case staging = "Staging"
    case live = "Live"
}

/// LoginType enum
public enum LoginType:String{
    case email = "Mail"
    case otp = "OTP"
    case social = "Social"
}


/// Order Type enum
public enum OrderType:String{
    case product = "Product"
    case subscription = "Subscription"
}
