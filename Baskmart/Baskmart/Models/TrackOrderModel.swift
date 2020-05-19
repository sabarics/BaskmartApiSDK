//
//  TrackOrderModel.swift
//  Hitches&Glitches
//
//  Created by Zuper on 17/10/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation
// MARK: - TrackOrderData
//public struct TrackOrderData: Codable {
//    public let data: TrackOrder?
//}
//
//// MARK: - DataClass
//public struct TrackOrder: Codable {
//    public let user: User?
//    public let userLocation: UserLocation?
//    public let customerLocation: CustomerLocation?
//
//    enum CodingKeys: String, CodingKey {
//        case user
//        case userLocation = "user_location"
//        case customerLocation = "customer_location"
//    }
//}
//
//// MARK: - CustomerLocation
//public struct CustomerLocation: Codable {
//    public let latitude, longitude: String?
//}
//
//// MARK: - User
//public struct User: Codable {
//    public let userID, firstName, lastName, profilePicture: String?
//    public let homePhoneNumber, workPhoneNumber: String?
//    public let designation: String?
//
//    enum CodingKeys: String, CodingKey {
//        case userID = "user_id"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case profilePicture = "profile_picture"
//        case homePhoneNumber = "home_phone_number"
//        case workPhoneNumber = "work_phone_number"
//        case designation = "designation"
//    }
//}
//
//// MARK: - UserLocation
//public struct UserLocation: Codable {
//    public let latitude, longitude, createdAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case latitude, longitude
//        case createdAt = "created_at"
//    }
//}



import Foundation
// MARK: - TrackOrderData
public struct TrackOrderData: Codable {
    public let data: TrackOrder?
}

// MARK: - DataClass
public struct TrackOrder: Codable {
    public let shippingAddress: ShippingAddress?
    public let customerLocation: CustomerLocation?
    public let locations: [Locations]?
    public let assignedTo: [AssignedToUser]?
    
    enum CodingKeys: String, CodingKey {
        case shippingAddress = "shipping_address"
        case customerLocation = "customer_location"
        case locations
        case assignedTo = "assigned_to"
    }
}

// MARK: - AssignedTo
public struct AssignedToUser: Codable {
    public let user: User?
    public let team: Team?
    public let id, acceptanceStatus: String?
    
    enum CodingKeys: String, CodingKey {
        case user, team
        case id = "_id"
        case acceptanceStatus = "acceptance_status"
    }
}

// MARK: - Team
public struct Team: Codable {
    public let teamName, teamUid: String?
    
    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case teamUid = "team_uid"
    }
}

// MARK: - User
public struct User: Codable {
    public let profilePicture: String?
    public let firstName, lastName, userUid, homePhoneNumber: String?
    public let workPhoneNumber, designation: String?
    
    enum CodingKeys: String, CodingKey {
        case profilePicture = "profile_picture"
        case firstName = "first_name"
        case lastName = "last_name"
        case userUid = "user_uid"
        case homePhoneNumber = "home_phone_number"
        case workPhoneNumber = "work_phone_number"
        case designation
    }
}

// MARK: - CustomerLocation
public struct CustomerLocation: Codable {
    public let latitude, longitude: String?
}

// MARK: - Location
public struct Locations: Codable {
    public let latitude, longitude, userUid: String?
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case userUid = "user_uid"
    }
}
