//
//  ProductCategoryModel.swift
//  Fipola-Customer-iOS
//
//  Created by APPLE on 05/08/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation

// MARK: - ProductCategory
public struct ProductCategory: Codable {
    public let id: String?
    public let isParent: Bool?
    public let isDeleted: Bool?
    public let name: String?
    public let storeID: String?
    public let urlSlug: String?
    public let categoryDescription: String?
    public let image: String?
    public let createdBy: String?
    public let childCategories: [ChildCategory]?
    public let categorySEO: CategorySEO?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let productId: String?
    public let parentCategoryID: ChildProductCategory?
    public let productSEO: ProductSEO?
    public let commonTax, commonStock, commonPrice, isAvailable: Bool?
    public let parentSku, productCategoryID: String?
    public let displayImage: [DisplayImage]?
    public let quantity, sellingPrice, compareAtPrice: Int?
    public let productMetaDatas: [ProductMetaData]?
    public let productTags, taxes:  [String]?
    // public let productVariants: ProductVariant?
    public let productOtherDetails: [ProductOtherDetails]?
    public let availability: [Availability]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isParent = "is_parent"
        case isDeleted = "is_deleted"
        case name
        case storeID = "store_id"
        case urlSlug = "url_slug"
        case categoryDescription = "description"
        case image
        case createdBy = "created_by"
        case childCategories = "child_categories"
        case categorySEO = "category_seo"
        case createdAt, updatedAt
        case v = "__v"
        case productId = "id"
        case parentCategoryID = "parent_category_id"
        case productSEO = "product_seo"
        case commonTax = "common_tax"
        case commonStock = "common_stock"
        case commonPrice = "common_price"
        case isAvailable = "is_available"
        case parentSku = "parent_sku"
        case productCategoryID = "product_category_id"
        case displayImage = "display_image"
        case quantity
        case sellingPrice = "selling_price"
        case compareAtPrice = "compare_at_price"
        case productMetaDatas = "product_meta_datas"
        case productTags = "product_tags"
        case taxes
        //    case productVariants = "product_variants"
        case productOtherDetails = "product_other_details"
        case availability
    }
}

// MARK: - ProductCategory
public struct ChildProductCategory: Codable {
    public let id: String?
    public let isParent: Bool?
    public let isDeleted: Bool?
    public let name: String?
    public let storeID: String?
    public let urlSlug: String?
    public let categoryDescription: String?
    public let image: String?
    public let createdBy: String?
    public let childCategories: [SubChildCategory]?
    public let categorySEO: CategorySEO?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let productId: String?
    public let parentCategoryID: String?
    public let productSEO: ProductSEO?
    public let commonTax, commonStock, commonPrice, isAvailable: Bool?
    public let parentSku, productCategoryID: String?
    public let displayImage: [DisplayImage]?
    public let quantity, sellingPrice, compareAtPrice: Int?
    public let productMetaDatas: [ProductMetaData]?
    public let productTags, taxes:  [String]?
    public let productVariants: [ProductVariant]?
    public let productOtherDetails: [ProductOtherDetails]?
    public let availability: [Availability]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isParent = "is_parent"
        case isDeleted = "is_deleted"
        case name
        case storeID = "store_id"
        case urlSlug = "url_slug"
        case categoryDescription = "description"
        case image
        case createdBy = "created_by"
        case childCategories = "child_categories"
        case categorySEO = "category_seo"
        case createdAt, updatedAt
        case v = "__v"
        case productId = "id"
        case parentCategoryID = "parent_category_id"
        case productSEO = "product_seo"
        case commonTax = "common_tax"
        case commonStock = "common_stock"
        case commonPrice = "common_price"
        case isAvailable = "is_available"
        case parentSku = "parent_sku"
        case productCategoryID = "product_category_id"
        case displayImage = "display_image"
        case quantity
        case sellingPrice = "selling_price"
        case compareAtPrice = "compare_at_price"
        case productMetaDatas = "product_meta_datas"
        case productTags = "product_tags"
        case taxes
        case productVariants = "product_variants"
        case productOtherDetails = "product_other_details"
        case availability
    }
}

// MARK: - Product other details
public struct ChildCategory: Codable {
    public let id: String?
    public let categoryID: ChildProductCategory?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case categoryID = "category_id"
    }
}

public struct SubChildCategory: Codable {
    public let id: String?
    public let categoryID: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case categoryID = "category_id"
    }
}

// MARK: - Product Other details
public struct ProductOtherDetails: Codable
{
    public let minQuantity,maxQuantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case minQuantity = "min_quantity"
        case maxQuantity = "max_quantity"
    }
}

//MARK:- Product Variants
public struct ProductVariant: Codable {
    public let quantity: Double?
    public let trackQuantity: Bool?
    public let alertStockQuantity: Int?
    public let id, variantName, sku: String?
    public let sellingPrice, compareAtPrice: Double?
    public let purchasePrice: Double?
    public let displayImage: [DisplayImage]?
    public let locationStock: [LocationStock]?
    public var isSelected: Bool = false
    public var selectedQuanity:Int = 0
    public var slots:[DeliverySlotList]?
    public var isAvailable:Bool?
    
    enum CodingKeys: String, CodingKey {
        case quantity
        case trackQuantity = "track_quantity"
        case alertStockQuantity = "alert_stock_quantity"
        case id = "_id"
        case variantName = "variant_name"
        case sku
        case sellingPrice = "selling_price"
        case compareAtPrice = "compare_at_price"
        case purchasePrice = "purchase_price"
        case displayImage = "display_image"
        case locationStock = "location_stock"
        case slots
    }
}
