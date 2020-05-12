//
//  LoginModel.swift
//  Baskmart
//
//  Created by Zuper on 13/02/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation

// MARK: - CustomerDetails
public struct CustomerDetails: Codable {
    public let customer: Customer?
    public let token: String?
}

public struct UserDetails: Codable {
    public var data: Customer?
}

// MARK: - Customer
public struct Customer: Codable {
    public let id: String?
    public var local: Local?
    public let phoneNo, customerTags: [String]?
    public let orderCount, points: Int?
    public let orderTotal: Double?
    public let isVerified, isDeleted: Bool?
    public let storeID, firstName, lastName: String?
    public let profileImages: [Images]?
    public var address: [Address]?
    //public let customerGroups: [String]
    public let customFields: [CustomFieldData]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let storeData: StoreData?
    public let type: String?
    public let otherApplicationDetails: OtherApplicationDetails?
    
   public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case local
        case phoneNo = "phone_no"
        case customerTags = "customer_tags"
        case orderCount = "order_count"
        case orderTotal = "order_total"
        case points
        case isVerified = "is_verified"
        case isDeleted = "is_deleted"
        case storeID = "store_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImages = "profile_images"
        case address
       // case customerGroups = "customer_groups"
        case customFields = "custom_fields"
        case createdAt, updatedAt
        case v = "__v"
        case storeData = "store_data"
        case type
        case otherApplicationDetails = "other_application_details"
    }
}


// MARK: - CustomerNotificationSetting
public struct CustomerNotificationSetting: Codable {
    public let smsNotification, emailNotification, inAppNotification: Bool?
    public let id, event: String?
    
    enum CodingKeys: String, CodingKey {
        case smsNotification = "sms_notification"
        case emailNotification = "email_notification"
        case inAppNotification = "in_app_notification"
        case id = "_id"
        case event
    }
}

// MARK: -  CustomFields
public struct CustomFieldData: Codable {
    public let label, name, value, id: String?
    
    
    enum CodingKeys: String, CodingKey {
        case label, value, name
        case id = "_id"
    }
}

// MARK: - OtherApplicationDetails
public struct OtherApplicationDetails: Codable {
    public let oneSignalID: String?

    enum CodingKeys: String, CodingKey {
        case oneSignalID = "one_signal_id"
    }
}


public struct Images: Codable{
    public let image: String?

    enum CodingKeys: String, CodingKey {
        case image
    }
}


// MARK: - EmployeeNotificationSetting
public struct EmployeeNotificationSetting: Codable {
    public let event: String?
    public let emailNotification: [EmailNotification]?
    
    enum CodingKeys: String, CodingKey {
        case event
        case emailNotification = "email_notification"
    }
}

// MARK: - EmailNotification
public struct EmailNotification: Codable {
    public let employeeIDS: String?
    
    enum CodingKeys: String, CodingKey {
        case employeeIDS = "employee_ids"
    }
}

// MARK: - Address
public struct Address: Codable {
    public let isDefault: Bool?
    public let id, firstName, lastName, street: String?
    public let locality, landmark, city, zipCode: String?
    public let country, state, latitude, longitude: String?
    public let phoneNo: String?
    public var isSelected: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case id = "_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case street, locality, landmark, city
        case zipCode = "zip_code"
        case country, state, latitude, longitude
        case phoneNo = "phone_no"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decodeIfPresent(String.self, forKey: .id)
        isDefault = try? container.decodeIfPresent(Bool.self, forKey: .isDefault)
        firstName = try? container.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try? container.decodeIfPresent(String.self, forKey: .lastName)
        street = try? container.decodeIfPresent(String.self, forKey: .street)
        locality = try? container.decodeIfPresent(String.self, forKey: .locality)
        city = try? container.decodeIfPresent(String.self, forKey: .city)
        zipCode = try? container.decodeIfPresent(String.self, forKey: .zipCode)
        landmark = try? container.decodeIfPresent(String.self, forKey: .landmark)
        country = try? container.decodeIfPresent(String.self, forKey: .country)
        state = try? container.decodeIfPresent(String.self, forKey: .state)
        latitude = try? container.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try? container.decodeIfPresent(String.self, forKey: .longitude)
        if let value = try? container.decodeIfPresent(Int.self, forKey: .phoneNo) {
            phoneNo = "\(value)"
        } else {
            phoneNo = try? container.decodeIfPresent(String.self, forKey: .phoneNo)
        }
    }
}

// MARK: - Local
public struct Local: Codable {
    public var email,phoneNo: String?
    public let isPasswordAvailable: Bool?
    
    enum CodingKeys: String, CodingKey {
        case email
        case isPasswordAvailable = "is_password_available"
        case phoneNo = "phone_no"
    }
}

// MARK: - StoreData
public struct StoreData: Codable {
    public let id: String?
    public let isBlocked, isDeleted: Bool?
    public let name, subDomain, email, webTheme: String?
    public let logo, address, countryID, stateID: String?
    public let currencyID, createdAt, updatedAt: String?
    public let v: Int?
    public let customerNotificationSettings: [CustomerNotificationSetting]?
    public let employeeNotificationSettings: [EmployeeNotificationSetting]?
    public let isChild: Bool?
    public let childstores: [Childstore]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isBlocked = "is_blocked"
        case isDeleted = "is_deleted"
        case name
        case subDomain = "sub_domain"
        case email
        case webTheme = "web_theme"
        case logo, address
        case countryID = "country_id"
        case stateID = "state_id"
        case currencyID = "currency_id"
        case createdAt, updatedAt
        case v = "__v"
        case customerNotificationSettings = "customer_notification_settings"
        case employeeNotificationSettings = "employee_notification_settings"
        case isChild = "is_child"
        case childstores
    }
}

// MARK: - Childstore
public struct Childstore: Codable {
    public let isActive: Bool?
    public let id, pincodes, city, childstoreID: String?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case id = "_id"
        case pincodes, city
        case childstoreID = "childstore_id"
    }
}



