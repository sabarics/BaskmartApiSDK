//
//  SliderModel.swift
//  Fipola-Customer-iOS
//
//  Created by APPLE on 03/08/19.
//  Copyright © 2019 Zuper. All rights reserved.
//
import Foundation
// MARK: - SliderData
public struct SliderData: Codable {
    public let data: [Slider]
}
// MARK: - Datum
public struct Slider: Codable {
    public let isActive, isDeleted: Bool?
    public let id: String?
    public let slides: [Slide?]
    public let channel, storeID, createdBy, createdAt: String?
    public let updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case isDeleted = "is_deleted"
        case id = "_id"
        case slides, channel
        case storeID = "store_id"
        case createdBy = "created_by"
        case createdAt, updatedAt
        case v = "__v"
    }
}
// MARK: - Slide
public struct Slide: Codable {
    public let id, type: String?
    public let text: String?
    public let image: String?
    public let redirectID: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case type, text, image
        case redirectID = "redirect_id"
    }
}
// MARK: - BestSellersData
public struct BestSellersData: Codable {
    public let data: [BestSeller]
}
// MARK: - BestSeller
public struct BestSeller: Codable {
    public let isDeleted: Bool?
    public let id, name, datumDescription, urlSlug: String?
    public let products: [Product]
    public let storeID, createdBy, createdAt, updatedAt: String?
    public let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case isDeleted = "is_deleted"
        case id = "_id"
        case name
        case datumDescription = "description"
        case urlSlug = "url_slug"
        case products = "product_ids"
        case storeID = "store_id"
        case createdBy = "created_by"
        case createdAt, updatedAt
        case v = "__v"
    }
}
// MARK: - Product
public struct Product: Codable {
    public let id: String?
    public let productID: ProductData?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productID = "product_id"
    }
}

// MARK: - StorePagesData
public struct StorePagesData: Codable {
    public let data: [StorePage]
}

// MARK: - StorePage
public struct StorePage: Codable
{
    public let id, name, datumDescription, urlSlug: String?
    public let pageContent, storeID, createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case datumDescription = "description"
        case urlSlug = "url_slug"
        case pageContent = "page_content"
        case storeID = "store_id"
        case createdAt, updatedAt
    }
}
