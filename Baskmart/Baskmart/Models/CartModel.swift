//
//  CartModel.swift
//  Fipola-Customer-iOS
//
//  Created by APPLE on 05/08/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation

// MARK: - CartData
public struct CartData: Codable {
    public let data: CartDetails
}

// MARK: - DataClass
public struct CartDetails: Codable {
    public let id: String?
    public let payment: Payment?
    public let discountValue: Double?
    public let discountByPoints, points: Int?
    public let isDeleted: Bool?
    public let storeID, sessionID: String?
    public let products: [ProductCartData]?
    public let customerNotes:[CustomerNotes]?
    public let taxes:[Tax]?
    public let discounts: [Discount]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    //public let customerID: CustomerDetails?
    public let shippingAddress: ShippingAddress?
    public let billingAddress: ShippingAddress?
    public let deliveryData: DeliveryData?
    public let deliveryDate: String?
    public let subTotal, total, discount: Double?
    public let orderType: String?
    public let pointsGenerated, pointsUsed: Int?
    public let usePoints: Bool?
    public let tax: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case payment
        case discountValue = "discount_value"
        case discountByPoints = "discount_by_points"
        case points
        case isDeleted = "is_deleted"
        case storeID = "store_id"
        case sessionID = "session_id"
        case products
        case customerNotes = "customer_notes"
        case taxes, discounts, createdAt, updatedAt
        case v = "__v"
        //case customerID = "customer_id"
        case shippingAddress = "shipping_address"
        case billingAddress = "billing_address"
        case deliveryData = "delivery_data"
        case deliveryDate = "delivery_date"
        case subTotal = "sub_total"
        case total, discount
        case orderType = "order_type"
        case pointsGenerated = "points_generated"
        case pointsUsed = "points_used"
        case usePoints = "use_points"
        case tax
    }
}

// MARK: - DeliveryData
public struct DeliveryData: Codable {
    public var day, startTime, endTime, type: String?
    public let deliveryCost: Double?
    public let isDeleted, isHoliday: Bool?
    public let deliveryType: String?
    
    enum CodingKeys: String, CodingKey {
        case day
        case startTime = "start_time"
        case endTime = "end_time"
        case type
        case deliveryCost = "delivery_cost"
        case isDeleted = "is_deleted"
        case isHoliday = "is_holiday"
        case deliveryType = "delivery_type"
    }
}

// MARK: - Payment
public struct Payment: Codable {
    public let isPaid: Bool?
    public let paymentMethod: String?
    
    enum CodingKeys: String, CodingKey {
        case isPaid = "is_paid"
        case paymentMethod = "payment_method"
    }
}

// MARK: - ShippingAddress
public struct ShippingAddress: Codable {
    public let isDefault: Bool?
    public let id, firstName, lastName, street: String?
    public let locality, landmark, city, zipCode: String?
    public let country, state, latitude, longitude: String?
    public var phoneNo: String?
    public var isSelected: Bool = false
    public var addressId: String?
    
    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case id = "_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case street, locality, landmark, city
        case zipCode = "zip_code"
        case country, state, latitude, longitude
        case phoneNo = "phone_no"
        case addressId = "address_id"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(String.self, forKey: .id)
        isDefault = try? container.decode(Bool.self, forKey: .isDefault)
        firstName = try? container.decode(String.self, forKey: .firstName)
        lastName = try? container.decode(String.self, forKey: .lastName)
        street = try? container.decode(String.self, forKey: .street)
        locality = try? container.decode(String.self, forKey: .locality)
        city = try? container.decode(String.self, forKey: .city)
        zipCode = try? container.decode(String.self, forKey: .zipCode)
        landmark = try? container.decode(String.self, forKey: .landmark)
        country = try? container.decode(String.self, forKey: .country)
        state = try? container.decode(String.self, forKey: .state)
        latitude = try? container.decode(String.self, forKey: .latitude)
        longitude = try? container.decode(String.self, forKey: .longitude)
        if let value = try? container.decodeIfPresent(Int.self, forKey: .phoneNo) {
            phoneNo = "\(value)"
        } else {
            phoneNo = try? container.decodeIfPresent(String.self, forKey: .phoneNo) 
        }
        addressId = try? container.decode(String.self, forKey: .addressId)
    }
}

// MARK: - CustomerNotes
public struct CustomerNotes: Codable {
    public let note, attachments: String?
    public let createdAt: String?
}

// MARK: - Tax
public struct Tax: Codable {
    public let taxName: String?
    public let taxValue: Int?
    public let taxDescription, type: String?
    public let isActive: Bool?
    
    enum CodingKeys: String, CodingKey {
        case taxName = "tax_name"
        case taxValue = "tax_value"
        case taxDescription = "description"
        case type
        case isActive = "is_active"
    }
}

// MARK: - Discount
public struct Discount: Codable {
    public let discountCode, message: String?
    public let discountValue: String?
    public let type:String?
   // public let discountID: String?
    //public let productCategoryID: ProductCategory?
    public let valid: Bool?
    
    enum CodingKeys: String, CodingKey {
        case discountCode = "discount_code"
        case discountValue = "discount_value"
        case type
       // case discountID = "discount_id"
        //case productCategoryID = "product_category_id"
        case valid = "is_valid"
        case message = "message"
    }
}

// MARK: - WishListData
public struct WishListData: Codable {
    public let data: WishList
}

// MARK: - WishList
public struct WishList: Codable {
    public let id: String?
    public let isDefault, isDeleted: Bool?
    public let storeID, customerID: String?
    public let products: [ProductData]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isDefault = "is_default"
        case isDeleted = "is_deleted"
        case storeID = "store_id"
        case customerID = "customer_id"
        case products, createdAt, updatedAt
        case v = "__v"
    }
}


// MARK: - ProductData
public struct ProductCartData: Codable {
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
   // public let productCategoryID: String?
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
    public let selectedVariant: String?
    public let selectedProductVariant: ProductVariant?
    public let deliveryDate:String?
    public let deliveryData: DeliveryData?
    public let metaData: String?
    
    
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
      //  case productCategoryID = "product_category_id"
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
        case selectedVariant = "selected_product_variant_id"
        case selectedProductVariant = "selected_product_variant"
        case deliveryData = "delivery_data"
        case deliveryDate = "delivery_date"
        case metaData = "meta_data"
    }
}





