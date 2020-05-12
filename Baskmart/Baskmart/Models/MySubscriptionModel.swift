//
//  MySubscriptionModel.swift
//  Hitches&Glitches
//
//  Created by Zuper on 24/10/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation

// MARK: - SubscriptionData
public struct MySubscriptionList: Codable {
    public let data: [MySubscriptionData]?
}

// MARK: - Datum
public struct MySubscriptionData: Codable {
    public let variant: Variant?
    public let isActive, isDeleted: Bool?
    public let id, subscriptionName, datumDescription, icon: String?
    public let endDate, storeID, customerID: String?
    public let addresses: [Address]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let subscriptionNumber: Int?
    public let renewedFrom: String?
    public let isRenewed: Bool?
    public let subscriptionId: String?
    public let isApproved: Bool?
    public let isRejected: Bool?
    public let parentSku:String?
    public let contractStatus: String?
    public let isExpired:Bool?
    public let startDate: String?
    
    enum CodingKeys: String, CodingKey {
        case variant
        case isActive = "is_active"
        case isDeleted = "is_deleted"
        case id = "_id"
        case subscriptionId = "subscription_id"
        case subscriptionName = "subscription_name"
        case datumDescription = "description"
        case icon
        case endDate = "end_date"
        case storeID = "store_id"
        case customerID = "customer_id"
        case addresses, createdAt, updatedAt
        case v = "__v"
        case subscriptionNumber = "subscription_number"
        case renewedFrom = "renewed_from"
        case isRenewed = "is_renewed"
        case isApproved = "is_approved"
        case isRejected = "is_rejected"
        case parentSku = "parent_sku"
        case contractStatus = "contract_status"
        case isExpired = "is_expired"
        case startDate = "start_date"
    }
}

// MARK: - Variant
public struct Variant: Codable {
    public let billingPeriod: BillingPeriod?
    public let isActive: Bool?
    public let name, icon: String?
    public let applicableTo: [ApplicableTo]?
    
    enum CodingKeys: String, CodingKey {
        case billingPeriod = "billing_period"
        case isActive = "is_active"
        case name, icon
        case applicableTo = "applicable_to"
    }
}

// MARK: - ApplicableTo
public struct ApplicableTo: Codable {
    public let requestFields: [RequestField]?
    public let id, productID: String?
    public let quantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case requestFields = "request_fields"
        case id = "_id"
        case productID = "product_id"
        case quantity
    }
}

// MARK: - RequestField
public struct RequestField: Codable {
    public var value: [String]?
    public var id, name, type: String?
    public var valueString: String = EMPTY
    public var selectedValue:Int = 0
    public var selectedValueArray:[String] = []
    public var isMandatory:Bool = false
    
    enum CodingKeys: String, CodingKey {
        case value
        case id = "_id"
        case name, type
    }
}

// MARK: - BillingPeriod
public struct BillingPeriod: Codable {
    public let billingPeriodID, period, value: String?
    public let price: Int?
    
    enum CodingKeys: String, CodingKey {
        case billingPeriodID = "billing_period_id"
        case period, value, price
    }
}


// MARK: - SubscriptionDetails
public struct SubscriptionDetails: Codable {
    public let data: SubscriptionDetailsData?
}

// MARK: - DataClass
public struct SubscriptionDetailsData: Codable {
    public let id: String?
    public let variant: VariantDetail?
    public let isActive, isDeleted: Bool?
    public let subscriptionName, dataDescription, icon, endDate: String?
    public let storeID, customerID: String?
    public let addresses: [Address]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let subscriptionNumber: Int?
    public let parentSku: String?
   
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case variant
        case isActive = "is_active"
        case isDeleted = "is_deleted"
        case subscriptionName = "subscription_name"
        case dataDescription = "description"
        case icon
        case endDate = "end_date"
        case storeID = "store_id"
        case customerID = "customer_id"
        case addresses, createdAt, updatedAt
        case v = "__v"
        case subscriptionNumber = "subscription_number"
        case parentSku = "parent_sku"
        
    }
}

// MARK: - ServiceType
public struct ServiceType: Codable {
    public let allowScheduled,allowExpress: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case allowScheduled = "allow_scheduled"
        case allowExpress = "allow_express"
    }
}

// MARK: - Variant
public struct VariantDetail: Codable {
    public let billingPeriod: BillingPeriodDetail?
    public let isActive: Bool?
    public let name, icon: String?
    public let applicableTo: [ApplicableToDetail]?
    
    enum CodingKeys: String, CodingKey {
        case billingPeriod = "billing_period"
        case isActive = "is_active"
        case name, icon
        case applicableTo = "applicable_to"
    }
}

// MARK: - BillingPeriod
public struct BillingPeriodDetail: Codable {
    public let billingPeriodID: BillingPeriodID?
    public let period, value: String?
    public let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case billingPeriodID = "billing_period_id"
        case period, value, price
    }
}

// MARK: - BillingPeriodID
public struct BillingPeriodID: Codable {
    public let id: String?
    public let isDeleted: Bool?
    public let period: String?
    public let value: Int?
    public let toShow, createdBy, createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isDeleted = "is_deleted"
        case period, value
        case toShow = "to_show"
        case createdBy = "created_by"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - ApplicableTo
public struct ApplicableToDetail: Codable {
    
    public var requestFields: [RequestField]?
    public let id: String?
    public let totalQuantity, availableQuantity: Int?
    public let productId: SubscriptionProductData?
    public var isAvailable: Bool = true
    public let serviceType: ServiceType?
    public let selectedProductVariantId: String?
    
    
    enum CodingKeys: String, CodingKey {
        case requestFields = "request_fields"
        case id = "_id"
        case productId = "product_id"
        case totalQuantity = "total_quantity"
        case availableQuantity = "available_quantity"
        case serviceType = "delivery_data"
        case selectedProductVariantId = "selected_product_variant_id"
    }
}

// MARK: - ProductData
public struct SubscriptionProductData: Codable {
    public let productSEO: ProductSEO?
    // public let productOtherDetails: ProductOtherDetails?
    public let commonTax: Bool?
    public let quantity: Double?
    public let trackQuantity: Bool?
    public let alertStockQuantity: Int?
    public let commonStock, commonPrice: Bool?
    public let productTags: [String]?
    public let isAvailable, isDeleted: Bool?
    public let productVariantsOptions:[ProductVariantsOptions]?
    public let locationStock: [LocationStock]?
    public let id, storeID, name, urlSlug,productId: String?
    public let selectedQuantity: Int?
    public let productCategoryID: String?
    public let parentSku, productDescription: String?
    public let displayImage: [DisplayImage]?
    public let sellingPrice: Double?
    public let productMetaDatas: [ProductMetaData]?
    public let productVariant: [ProductVariant]?
    public let taxes:[Tax]?
    public let availability: [Availability]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let comparedPrice: Double?
    public var deliveryDate:String = EMPTY
    public var deliveryData:DeliveryData?
    public var selectedVariantId:String = EMPTY
    
    
    enum CodingKeys: String, CodingKey {
        case productSEO = "product_seo"
        // case productOtherDetails = "product_other_details"
        case commonTax = "common_tax"
        case quantity
        case trackQuantity = "track_quantity"
        case alertStockQuantity = "alert_stock_quantity"
        case commonStock = "common_stock"
        case commonPrice = "common_price"
        case productTags = "product_tags"
        case isAvailable = "is_available"
        case isDeleted = "is_deleted"
        case productVariantsOptions = "product_variants_options"
        case locationStock = "location_stock"
        case id = "_id"
        case storeID = "store_id"
        case name
        case urlSlug = "url_slug"
        case productCategoryID = "product_category_id"
        case parentSku = "parent_sku"
        case productDescription = "description"
        case displayImage = "display_image"
        case sellingPrice = "selling_price"
        case productMetaDatas = "product_meta_datas"
        case taxes
        case productVariant = "product_variants"
        case availability, createdAt, updatedAt
        case v = "__v"
        case productId = "product_id"
        case selectedQuantity = "selected_quantity"
        case comparedPrice = "compare_at_price"
    }
}

