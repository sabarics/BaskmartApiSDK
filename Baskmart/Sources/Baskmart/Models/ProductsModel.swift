//
//  ProductsModel.swift
//  Fipola-Customer-iOS
//
//  Created by APPLE on 05/08/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation

// MARK: - ProductData
public struct ProductData: Codable {
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
    public let productCategoryID: ChildProductCategory?
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

//// MARK: - ProductCategory
//public struct ProductCategoryObj: Codable {
//    public let productCategoryID: ProductCategoryID?
//    
//    enum CodingKeys: String, CodingKey {
//        case productCategoryID = "product_category_id"
//    }
//}
//
//// MARK: - ProductCategoryID
//public struct ProductCategoryID: Codable {
//    public let isParent, isDeleted: Bool?
//    public let id, name, storeID, urlSlug: String?
//    public let productCategoryIDDescription: String?
//    public let image: String?
//    public let createdBy: String?
//    public let childCategories: [ChildCategory]?
//    public let createdAt, updatedAt: String?
//    public let v: Int?
//    
//    enum CodingKeys: String, CodingKey {
//        case isParent = "is_parent"
//        case isDeleted = "is_deleted"
//        case id = "_id"
//        case name
//        case storeID = "store_id"
//        case urlSlug = "url_slug"
//        case productCategoryIDDescription = "description"
//        case image
//        case createdBy = "created_by"
//        case childCategories = "child_categories"
//        case createdAt, updatedAt
//        case v = "__v"
//    }
//}

// MARK: - ProductVariantsOptions
public struct ProductVariantsOptions: Codable {
    public let option: String?
    public let values: [String]?
    public let id: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case values
        case option
    }
}

// MARK: - DisplayImage
public struct DisplayImage: Codable {
    public let isDefault: Bool?
    public let id: String?
    public let image: String?
    
    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case id = "_id"
        case image
    }
}

// MARK: - CategorySEO
public struct CategorySEO: Codable {
    public let pageTitle: String?
    public let metaKeywords: [String]?
    public let metaDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case pageTitle = "page_title"
        case metaKeywords = "meta_keywords"
        case metaDescription = "meta_description"
    }
}

// MARK: - ProductMetaData
public struct ProductMetaData: Codable {
    public let showInUI, isDeleted: Bool?
    public let id, productMetaName, productMetaValue: String?
    
    enum CodingKeys: String, CodingKey {
        case showInUI = "show_in_ui"
        case isDeleted = "is_deleted"
        case id = "_id"
        case productMetaName = "product_meta_name"
        case productMetaValue = "product_meta_value"
    }
}

// MARK: - ProductSEO
public struct ProductSEO: Codable {
    public let metaKeyword: [String]?
    
    enum CodingKeys: String, CodingKey {
        case metaKeyword = "meta_keyword"
    }
}

// MARK: - ProductCategoryData
public struct ProductCategoryData: Codable {
    public let data: [ProductCategory]?
    public let total, limit, offset, pages: Int?
    public let grouped: [String]?
}

// MARK: - LocationStock
public struct LocationStock: Codable {
    public let id: String?
    public let storeLocationID: String?
    public let quantity: Int?
    public let sellingPrice: Double?
    public let compareAtPrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case storeLocationID = "store_location_id"
        case quantity
        case sellingPrice = "selling_price"
        case compareAtPrice = "compare_at_price"
    }
}

// MARK: - Availability
public struct Availability: Codable {
    public let available: Bool?
    public let id: String?
    public let channel: String?
    
    enum CodingKeys: String, CodingKey {
        case available
        case id = "_id"
        case channel
    }
}

// MARK: - AllProducts
public struct AllProducts: Codable {
    public let data: [ProductData]?
    public let total, limit, offset, pages: Int?
}

public struct AllCategoryProducts:Codable{
    public let data: [CategoryProducts]?
    public let total, limit, offset, pages: Int?
}

// MARK: - Datum
public struct CategoryProducts: Codable {
    public let categoryID: String?
    public let products: [ProductData]

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case products
    }
}
