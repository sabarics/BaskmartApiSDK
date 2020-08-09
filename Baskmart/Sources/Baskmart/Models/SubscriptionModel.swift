import Foundation

// MARK: - SubscriptionData
public struct PackageData: Codable {
    public let data: [Package]?
}

// MARK: - Package
public struct Package: Codable {
    public let isActive, isDeleted: Bool?
    public let id, subscriptionName, datumDescription, icon: String?
    public let price: Double?
    public let variants: [PackageVariant]?
    public let storeID, createdBy, createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case isDeleted = "is_deleted"
        case id = "_id"
        case subscriptionName = "subscription_name"
        case datumDescription = "description"
        case icon, variants
        case storeID = "store_id"
        case createdBy = "created_by"
        case createdAt, updatedAt
        case v = "__v"
        case price
    }
}

// MARK: - PackageVariant
public struct PackageVariant: Codable {
    public let isActive: Bool?
    public var billingPeriod: [PackageBillingPeriod]?
    public let applicableTo: [PackageApplicableTo]?
    public let id, name, icon: String?
    public let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case billingPeriod = "billing_period"
        case applicableTo = "applicable_to"
        case id = "_id"
        case name, price, icon
    }
}

// MARK: - PackageApplicableTo
public struct PackageApplicableTo: Codable {
    public let requestFields: [PackageRequestField]?
    public let id, productID: String?
    public let quantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case requestFields = "request_fields"
        case id = "_id"
        case productID = "product_id"
        case quantity
    }
}

// MARK: - PackageRequestField
public struct PackageRequestField: Codable {
    public let id, name, type: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, type
    }
}

// MARK: - PackageBillingPeriod
public struct PackageBillingPeriod: Codable {
    public let id, billingPeriodID: String?
    public let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case billingPeriodID = "billing_period_id"
        case price
    }
}


// MARK: - PackageDetailData
public struct PackageDetailData: Codable {
    public let data: PackageDetail?
}

// MARK: - DataClass
public struct PackageDetail: Codable {
    public let isActive, isDeleted: Bool?
    public let id, subscriptionName, dataDescription, icon: String?
    public let variants: [PackageDetailVariant]?
    public let storeID, createdBy, createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case isDeleted = "is_deleted"
        case id = "_id"
        case subscriptionName = "subscription_name"
        case dataDescription = "description"
        case icon, variants
        case storeID = "store_id"
        case createdBy = "created_by"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Variant
public struct PackageDetailVariant: Codable {
    public let isActive: Bool?
    public let billingPeriod: [PackageDetailBillingPeriod]?
    public let applicableTo: [PackageDetailApplicableTo]?
    public let id, name, icon: String?
    public let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case billingPeriod = "billing_period"
        case applicableTo = "applicable_to"
        case id = "_id"
        case name, price, icon
    }
}

// MARK: - ApplicableTo
public struct PackageDetailApplicableTo: Codable {
    public let deliveryData: DeliveryData?
    public let requestFields: [RequestField]?
    public let id: String?
    public let productID: SubscriptionProductData?
    public let quantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case deliveryData = "delivery_data"
        case requestFields = "request_fields"
        case id = "_id"
        case productID = "product_id"
        case quantity
    }
}


// MARK: - BillingPeriod
public struct PackageDetailBillingPeriod: Codable {
    public let id: String?
    public let billingPeriodID: BillingPeriodID?
    public let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case billingPeriodID = "billing_period_id"
        case price
    }
}

