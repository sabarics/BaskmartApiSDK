//
//  Functions.swift
//  ZuperKit
//
//  Created by apple on 31/01/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

//Functions


/// Set Root endpoints - live/staging
func setRootEndpoint(){
    if endpointType == .live{
        wsApiUrlValue = "https://live.hitchesglitches.com/api/"
    }else{
        wsApiUrlValue = "https://staging.hitchesglitches.com/api/"
    }
}


/// Get Login Url
/// - Parameter type: Social,mail,otp
func getLoginUrl(type:LoginType) -> String
{
    if type == .social
    {
         return wsApiUrlValue + ServiceName.socialLogin.rawValue
    }
    else if type == .email
    {
         return wsApiUrlValue + ServiceName.emailLogin.rawValue
    }
    else if type == .otp
    {
         return wsApiUrlValue + ServiceName.generateOtp.rawValue
    }
    else
    {
        return EMPTY
    }
   
}

//MARK:- Character Set
func getCharacterSet() -> CharacterSet
{
    let mutableSet = NSMutableCharacterSet()
    
    mutableSet.formUnion(with: CharacterSet.alphanumerics)
    
    mutableSet.formUnion(with: CharacterSet.urlUserAllowed)
    
    mutableSet.formUnion(with: CharacterSet.urlPasswordAllowed)
    
    mutableSet.formUnion(with: CharacterSet.urlHostAllowed)
    
    mutableSet.formUnion(with: CharacterSet.urlQueryAllowed)
    
    mutableSet.formUnion(with: CharacterSet.urlFragmentAllowed)
    
    return mutableSet as CharacterSet
}



