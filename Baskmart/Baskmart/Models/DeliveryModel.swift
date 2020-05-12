//
//  DeliveryModel.swift
//  Fipola-Customer-iOS
//
//  Created by Zuper on 10/08/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation

// MARK: - ProductTransaction
public struct DeliverySlot: Codable {
    public let data: [DeliverySlotList]?
}

public struct ProductSlots: Codable {
    public let slots: DeliverySlotList?
}

// MARK: - DeliverySlotList
public struct DeliverySlotList: Codable {
    public let isActive, isDeleted: Bool?
    public let id, day: String?
    public var slots: [Slot]?
    public let storeID, createdBy: String?
    public let v: Int?
    public let createdAt, updatedAt: String?
    public var scheduleDate: Date?
    public var isSelected: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case isDeleted = "is_deleted"
        case id = "_id"
        case day, slots
        case storeID = "store_id"
        case createdBy = "created_by"
        case v = "__v"
        case createdAt, updatedAt
    }
}

// MARK: - Slot
public struct Slot: Codable {
    public let isActive: Bool?
    public let id, startTime, endTime, cutoffTime: String?
    public var cutoffDate: Date?
    public var isSelected: Bool = false
    public var isAvailable: Bool?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case id = "_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case cutoffTime = "cutoff_time"
        case isAvailable = "is_available"
    }
}




// MARK: - ProductTransaction
public struct DeliveryType: Codable {
    public let data: [DeliveryTypeList]?
}

// MARK: - Datum
public struct DeliveryTypeList: Codable {
    public let isActive, isDeleted: Bool?
    public let id, storeID, name, type: String?
    public let price, cutoffPrice: Int?
    public let createdAt, updatedAt: String?
    public let image: String?
    public let fromTime, toTime, datumDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case isDeleted = "is_deleted"
        case id = "_id"
        case storeID = "store_id"
        case name, type, price
        case cutoffPrice = "cutoff_price"
        case createdAt, updatedAt, image
        case fromTime = "from_time"
        case toTime = "to_time"
        case datumDescription = "description"
    }
}



// MARK: - ProductTransaction
public struct LocationServiceData: Codable {
    public let data: [LocationServiceList]?
}

// MARK: - LocationServiceList
public struct LocationServiceList: Codable {
    public let id: String?
    public let isDeleted: Bool?
    public let name, storeID: String?
    public let servingLocations: [ServiceLocation]?
    public let zuperTeamUid, zuperTeamLeaderUid, createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isDeleted = "is_deleted"
        case name
        case storeID = "store_id"
        case servingLocations = "serving_locations"
        case zuperTeamUid = "zuper_team_uid"
        case zuperTeamLeaderUid = "zuper_team_leader_uid"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - ServingLocation
public struct ServiceLocation: Codable {
    public let isActive: Bool?
    public let id, pincode: String?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case id = "_id"
        case pincode
    }
}

typealias LocationService = [LocationServiceList]

