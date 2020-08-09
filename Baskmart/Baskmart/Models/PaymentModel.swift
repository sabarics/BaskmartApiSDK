//
//  PaymentModel.swift
//  Fipola-Customer-iOS
//
//  Created by Zuper on 12/08/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation
// MARK: - ProductTransaction
public struct PaymentDetails: Codable {
    public let data: PaymentData?
    public let location: [Location]?
}

// MARK: - DataClass
public struct PaymentData: Codable {
    public let id: String?
    public let isBlocked, isDeleted: Bool?
    public let name, subDomain, email, zuperCompanyUid: String?
    public let zuperAPIKey, zuperCategoryUid, zuperCategory, webTheme: String?
    public let appLink: String?
    public let logo, address, countryID, stateID: String?
    public let currencyID: String?
    public let storeMetaConfig: [StoreMetaConfig]?
    public let paymentMethods: [PaymentMethod]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isBlocked = "is_blocked"
        case isDeleted = "is_deleted"
        case name
        case subDomain = "sub_domain"
        case email
        case zuperCompanyUid = "zuper_company_uid"
        case zuperAPIKey = "zuper_api_key"
        case zuperCategoryUid = "zuper_category_uid"
        case zuperCategory = "zuper_category"
        case webTheme = "web_theme"
        case appLink = "app_link"
        case logo, address
        case countryID = "country_id"
        case stateID = "state_id"
        case currencyID = "currency_id"
        case storeMetaConfig = "store_meta_config"
        case paymentMethods = "payment_methods"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - PaymentMethod
public struct PaymentMethod: Codable {
    public let paymentMethodID: PaymentMethodID?
    public let paymentProviderID: PaymentProviderID?
    public let fields: [Field]?
    
    enum CodingKeys: String, CodingKey {
        case paymentMethodID = "payment_method_id"
        case paymentProviderID = "payment_provider_id"
        case fields
    }
}

// MARK: - Field
public struct Field: Codable {
    public let name, value: String?
}

// MARK: - PaymentMethodID
public struct PaymentMethodID: Codable {
    public let id: String?
    public let isDeleted: Bool?
    public let image: String?
    public let type, keyword, paymentMethodIDDescription, createdAt: String?
    public let updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isDeleted = "is_deleted"
        case image, type, keyword
        case paymentMethodIDDescription = "description"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - PaymentProviderID
public struct PaymentProviderID: Codable {
    public let id, name: String?
    public let requiredFields: [RequiredField]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case requiredFields = "required_fields"
    }
}

// MARK: - RequiredField
public struct RequiredField: Codable {
    public let name, type: String?
}

// MARK: - StoreMetaConfig
public struct StoreMetaConfig: Codable {
    public let metaConfigName, metaConfigValue: String?
    
    enum CodingKeys: String, CodingKey {
        case metaConfigName = "meta_config_name"
        case metaConfigValue = "meta_config_value"
    }
}

// MARK: - Location
public struct Location: Codable {
    public let id: String?
    public let isDeleted: Bool?
    public let name, storeID: String?
    public let servingLocations: [ServingLocation]?
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
public struct ServingLocation: Codable {
    public let isActive: Bool?
    public let id, pincode: String?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case id = "_id"
        case pincode
    }
}





//MARK: - Pending payment model

import Foundation

// MARK: - PendingPaymentDetails
public struct PendingPaymentDetails: Codable {
    public let data: PendingPayment?
}

// MARK: - DataClass
public struct PendingPayment: Codable {
    public let id: String?
    public let payment: Payment?
    public let amountPaid: Int?
    public let isActive, isDeleted: Bool?
    public let storeID: String?
    public let customerID: PaymentCustomerID?
    public let paymentRequestUid: String?
    public let amount: Double?
    public let status, zuperJobUid: String?
    public let createdBy: CreatedBy?
    public let statusHistory: [StatusHistory]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let orderDetails: OrderSummaryData?
    public let remarks: String?
    public let customerSubscriptionID: CustomerSubscriptionID?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case payment
        case amountPaid = "amount_paid"
        case isActive = "is_active"
        case isDeleted = "is_deleted"
        case storeID = "store_id"
        case customerID = "customer_id"
        case paymentRequestUid = "payment_request_uid"
        case amount, status
        case zuperJobUid = "zuper_job_uid"
        case createdBy = "created_by"
        case statusHistory = "status_history"
        case createdAt, updatedAt
        case v = "__v"
        case orderDetails = "order_id"
        case remarks = "remarks"
        case customerSubscriptionID = "customer_subscription_id"
    }
}


// MARK: - CustomerID
public struct PaymentCustomerID: Codable {
    public let id: String?
    public let local: Local?
    public let phoneNo: [String]?
    public let orderCount, orderTotal, points: Int?
    public let isVerified, isDeleted: Bool?
    public let firstName, lastName, storeID: String?
    public let address: [Address]?
    public let customFields: [CustomField]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let zuperCustomerUid: String?
    public let google: Google?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case local
        case phoneNo = "phone_no"
        case orderCount = "order_count"
        case orderTotal = "order_total"
        case points
        case isVerified = "is_verified"
        case isDeleted = "is_deleted"
        case firstName = "first_name"
        case lastName = "last_name"
        case storeID = "store_id"
        case address
        case customFields = "custom_fields"
        case createdAt, updatedAt
        case v = "__v"
        case zuperCustomerUid = "zuper_customer_uid"
        case google
    }
}



// MARK: - Google
public struct Google: Codable {
    public let email, googleID: String?

    enum CodingKeys: String, CodingKey {
        case email
        case googleID = "google_id"
    }
}



