//
//  OrderSummaryModel.swift
//  Fipola-Customer-iOS
//
//  Created by Zuper on 14/08/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation

public struct OrderSummaryResponse: Codable
{
    public let data: OrderSummaryData?
    public let type: String?
    public let message: String?
    public let title: String?
}
public struct OrderListResponse: Codable
{
    public let data: [OrderSummaryData]?
}

public struct OrderDataResponse: Codable{
    public let data: OrderSummaryData?
}

// MARK: - OrderSummaryData
public struct OrderSummaryData: Codable {
    
    public let id: String?
    public let shippingAddress, billingAddress: ShippingAddress?
    public let payment: OrderPayment?
    public let deliveryData: DeliveryData?
    public let currentStatus: CurrentStatus?
    public let subTotal, discount, tax: Double?
    public let total: Double?
    public let discountValue: Double?
    public let discountByPoints, pointsUsed, pointsGenerated: Int?
    public let isDeleted, usePoints: Bool?
    public let storeID: String?
    public let products: [OrderProduct]?
    public let deliveryDate, orderType: String?
    public let discounts: [OrderDiscount]?
    public let storeLocationID: StoreLocationID?
  //  public let customerID: CustomerID?
    public let taxes: [Tax]?
    public let statusHistory: [OrderStatus]?
    public let createdAt: String?
    public let orderAudit: [OrderAudit]?
    public let customerNotes:[CustomerNotes]?
    public let updatedAt: String?
    public let orderNumber, v: Int?
    public let isFromSubscription: Bool?
    public let zuperJobId: String?
    public let pendingPayments: [PendingPaymentRequest]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case shippingAddress = "shipping_address"
        case billingAddress = "billing_address"
        case payment
        case deliveryData = "delivery_data"
        case currentStatus = "current_status"
        case total
        case subTotal = "sub_total"
        case discount, tax
        case discountValue = "discount_value"
        case discountByPoints = "discount_by_points"
        case pointsUsed = "points_used"
        case pointsGenerated = "points_generated"
        case isDeleted = "is_deleted"
        case usePoints = "use_points"
        case storeID = "store_id"
        case products
        case deliveryDate = "delivery_date"
        case orderType = "order_type"
        case discounts
        case storeLocationID = "store_location_id"
       // case customerID = "customer_id"
        case taxes
        case statusHistory = "status_history"
        case createdAt
        case customerNotes = "customer_notes"
        case orderAudit = "order_audit"
        case updatedAt
        case orderNumber = "order_number"
        case v = "__v"
        case isFromSubscription = "from_subscription"
        case zuperJobId = "zuper_job_uid"
        case pendingPayments = "pending_payment_requests"
    }
}

// MARK: - PendingPaymentRequest
public struct PendingPaymentRequest: Codable {
    public let paymentRequestID: String?

    enum CodingKeys: String, CodingKey {
        case paymentRequestID = "payment_request_id"
    }
}

// MARK: - OrderAudit
public struct OrderAudit: Codable {
    public let createdAt, id, data: String?
    public let updatedBy: String?
    
    enum CodingKeys: String, CodingKey {
        case createdAt
        case id = "_id"
        case data
        case updatedBy = "updated_by"
    }
}


// MARK: - CurrentStatus
public struct CurrentStatus: Codable {
    public let createdAt: String?
    public let statusID: StatusID?
    
    enum CodingKeys: String, CodingKey {
        case createdAt
        case statusID = "status_id"
    }
}

// MARK: - CustomerID
public struct CustomerID: Codable {
    public let id: String?
    public let local: Local?
    //public let phoneNo
    public let customerTags: [String]?
    public let orderCount, points: Int?
    public let orderTotal: Float?
    public let isVerified, isDeleted: Bool?
    public let firstName, lastName, storeID: String?
    public let profileImages: [String]?
    public let address: [Address]?
    public let customerGroups: [String]?
    public let customFields: [CustomField]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case local
      //  case phoneNo = "phone_no"
        case customerTags = "customer_tags"
        case orderCount = "order_count"
        case orderTotal = "order_total"
        case points
        case isVerified = "is_verified"
        case isDeleted = "is_deleted"
        case firstName = "first_name"
        case lastName = "last_name"
        case storeID = "store_id"
        case profileImages = "profile_images"
        case address
        case customerGroups = "customer_groups"
        case customFields = "custom_fields"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - CustomField
public struct CustomField: Codable {
    public let id, name, value: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, value
    }
}

// MARK: - Payment
public struct OrderPayment: Codable {
    public let isPaid: Bool?
    public let paymentMethod: OrderPaymentMethod?
    
    enum CodingKeys: String, CodingKey {
        case isPaid = "is_paid"
        case paymentMethod = "payment_method"
    }
}

// MARK: - PaymentMethod
public struct OrderPaymentMethod: Codable {
    public let id: String?
    public let isDeleted: Bool?
    public let image: String?
    public let type, keyword, paymentMethodDescription, createdAt: String?
    public let updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isDeleted = "is_deleted"
        case image, type, keyword
        case paymentMethodDescription = "description"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Product
public struct OrderProduct: Codable {
    public let selectedProductVariant: SelectedProductVariant?
    public let commonTax: Bool?
    public let id, productID: String?
    public let selectedQuantity: Int?
    public let name, urlSlug, productDescription, parentSku: String?
 //   public let productCategoryID: ProductCategoryID?
    public let sellingPrice, compareAtPrice: Int?
    public let taxes: [Tax]?
    public let displayImage: [DisplayImage]?
    public let commonStock, commonPrice: Bool?
    public let productMetaDatas: [ProductMetaData]?
    public let totalCompareAtPrice, totalSellingPrice: Int?
    public let selectedVariant: String?
    public let deliveryData: DeliveryData?
    
    enum CodingKeys: String, CodingKey {
        case selectedProductVariant = "selected_product_variant"
        case commonTax = "common_tax"
        case id = "_id"
        case productID = "product_id"
        case selectedQuantity = "selected_quantity"
        case name
        case urlSlug = "url_slug"
        case productDescription = "description"
        case parentSku = "parent_sku"
       // case productCategoryID = "product_category_id"
        case sellingPrice = "selling_price"
        case compareAtPrice = "compare_at_price"
        case taxes
        case displayImage = "display_image"
        case commonStock = "common_stock"
        case commonPrice = "common_price"
        case productMetaDatas = "product_meta_datas"
        case totalCompareAtPrice = "total_compare_at_price"
        case totalSellingPrice = "total_selling_price"
        case selectedVariant = "selected_product_variant_id"
        case deliveryData = "delivery_data"
    }
}

// MARK: - ProductCategoryID
public struct ProductCategoryID: Codable {
    public let id: String?
    public let isParent, isDeleted: Bool?
    public let name, storeID, urlSlug, productCategoryIDDescription: String?
    public let image: String?
    public let createdBy: String?
    public let childCategories: [ChildCategory]?
    public let categorySEO: CategorySEO?
    public let createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isParent = "is_parent"
        case isDeleted = "is_deleted"
        case name
        case storeID = "store_id"
        case urlSlug = "url_slug"
        case productCategoryIDDescription = "description"
        case image
        case createdBy = "created_by"
        case childCategories = "child_categories"
        case categorySEO = "category_seo"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - SelectedProductVariant
public struct SelectedProductVariant: Codable {
    public let quantity: Double?
    public let displayImage: [DisplayImage]?
    public let sku: String?
    public let alertStockQuantity: Int?
    public let variantName: String?
    public let trackQuantity: Bool?
    public let sellingPrice: Int?
    public let isAvailable: Bool?
    public let compareAtPrice: Int?
    public let purchasePrice: JSONNull?

    enum CodingKeys: String, CodingKey {
        case quantity
        case displayImage = "display_image"
        case sku
        case alertStockQuantity = "alert_stock_quantity"
        case variantName = "variant_name"
        case trackQuantity = "track_quantity"
        case sellingPrice = "selling_price"
        case isAvailable = "is_available"
        case compareAtPrice = "compare_at_price"
        case purchasePrice = "purchase_price"
    }
}

// MARK: - StoreLocationID
public struct StoreLocationID: Codable {
    public let id: String?
    public let isDeleted: Bool?
    public let name, storeID: String?
    public let servingLocations: [ServingLocation]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isDeleted = "is_deleted"
        case name
        case storeID = "store_id"
        case servingLocations = "serving_locations"
        case createdAt, updatedAt
        case v = "__v"
    }
}


// MARK: - OrderSummaryData
public struct OrderStatus: Codable {
    public let createdAt, id: String?
    public let statusID: StatusID?
    public let updatedBy: UpdatedBy?
    
    enum CodingKeys: String, CodingKey {
        case createdAt
        case id = "_id"
        case statusID = "status_id"
        case updatedBy = "updated_by"
    }
}

// MARK: - StatusID
public struct StatusID: Codable {
    public let id: String?
    public let isDeleted: Bool?
    public let name, storeID, masterOrderStatusID, createdBy: String?
    public let createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isDeleted = "is_deleted"
        case name
        case storeID = "store_id"
        case masterOrderStatusID = "master_order_status_id"
        case createdBy = "created_by"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - UpdatedBy
public struct UpdatedBy: Codable {
    public let id: String?
    public let isDeleted: Bool?
    public let firstName, lastName, storeID, email: String?
   // public let password, phoneNo, employeeType: String?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let allChildStoreAccess: Bool?
    public let childStoresAccess: [ChildStoresAccess]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isDeleted = "is_deleted"
        case firstName = "first_name"
        case lastName = "last_name"
        case storeID = "store_id"
        case email
        //, password
      //  case phoneNo = "phone_no"
      //  case employeeType = "employee_type"
        case createdAt, updatedAt
        case v = "__v"
        case allChildStoreAccess
        case childStoresAccess
    }
}

// MARK: - ChildStoresAccess
public struct ChildStoresAccess: Codable {
    public let id, storeID: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case storeID = "store_id"
    }
}


// MARK: - Discount
public struct OrderDiscount: Codable {
    public let discountCode: String?
    public let discountValue: Double?
    public let type:String?
  //  public let discountID: StoreData?
    //public let productCategoryID: ProductCategory?
    public let valid: Bool?
    
    enum CodingKeys: String, CodingKey {
        case discountCode = "discount_code"
        case discountValue = "discount_value"
        case type
      //  case discountID = "discount_id"
        //case productCategoryID = "product_category_id"
        case valid = "is_valid"
    }
}


class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    public var intValue: Int? {
        return nil
    }
    
    public var stringValue: String {
        return key
    }
}

