//
//  CustomerPaymentModel.swift
//  Hitches&Glitches
//
//  Created by Zuper on 03/12/19.
//  Copyright © 2019 Zuper. All rights reserved.
//

import Foundation

// MARK: - Categories
public struct CustomerPayment: Codable {
    public let data: [CustomerPaymentData]?
    public let total, limit, offset, pages: Int?
}

// MARK: - Datum
public struct CustomerPaymentData: Codable {
    public let id: String?
    public let payment: Payment?
    public let amountPaid: Int?
    public let isDeleted: Bool?
    public let storeID: String?
    public let customerID: CustomerDetail?
    public let paymentRequestUid: String?
    public let amount: Int?
    public let status: String?
    public let customerSubscriptionID: CustomerSubscriptionID?
    public let customerOrderID: OrderID?
    public let zuperContractUid, dueDate: String?
    public let createdBy: CreatedBy?
    public let statusHistory: [StatusHistory]?
    public let createdAt, updatedAt: String?
    public let v: Int?
    public let datumID: String?
    public let remarks: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case payment
        case amountPaid = "amount_paid"
        case isDeleted = "is_deleted"
        case storeID = "store_id"
        case customerID = "customer_id"
        case paymentRequestUid = "payment_request_uid"
        case amount, status
        case customerSubscriptionID = "customer_subscription_id"
        case zuperContractUid = "zuper_contract_uid"
        case dueDate = "due_date"
        case createdBy = "created_by"
        case statusHistory = "status_history"
        case createdAt, updatedAt
        case v = "__v"
        case datumID = "id"
        case customerOrderID = "order_id"
        case remarks = "remarks"
    }
}

// MARK: - CreatedBy
public struct CreatedBy: Codable {
    public let id, firstName, lastName, email: String?
    public let phoneNo, employeeType: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case phoneNo = "phone_no"
        case employeeType = "employee_type"
    }
}

// MARK: - CustomerID
public struct CustomerDetail: Codable {
    public let id: String?
    public let local: Local?
    public let phoneNo: [String]?
    public let orderCount, orderTotal: Int?
    public let firstName, lastName: String?
    public let profileImages: [String]?
    public let address: [Address]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case local
        case phoneNo = "phone_no"
        case orderCount = "order_count"
        case orderTotal = "order_total"
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImages = "profile_images"
        case address
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(String.self, forKey: .id)
        local = try? container.decode(Local.self, forKey: .local)
        firstName = try? container.decode(String.self, forKey: .firstName)
        lastName = try? container.decode(String.self, forKey: .lastName)
        orderCount = try? container.decode(Int.self, forKey: .orderCount)
        orderTotal = try? container.decode(Int.self, forKey: .orderTotal)
        profileImages = try? container.decode([String].self, forKey: .profileImages)
        address = try? container.decode([Address].self, forKey: .address)
        if let value = try? container.decodeIfPresent([Int].self, forKey: .phoneNo) {
            //phoneNo = String(value)
            var phoneValue: [String] = []
            for obj in value{
                phoneValue.append("\(obj)")
            }
            phoneNo = phoneValue
        } else {
            phoneNo = try container.decodeIfPresent([String].self, forKey: .phoneNo)
        }
    }
}

// MARK: - CustomerSubscriptionID
public struct CustomerSubscriptionID: Codable {
    public let id, subscriptionName, startDate, endDate: String?
    public let price, subscriptionNumber: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case subscriptionName = "subscription_name"
        case startDate = "start_date"
        case endDate = "end_date"
        case price
        case subscriptionNumber = "subscription_number"
    }
}

// MARK: - StatusHistory
public struct StatusHistory: Codable {
    public let id, status, createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case status, createdAt
    }
}


// MARK: - OrderID
public struct OrderID: Codable {
    public let id: String?
    public let total: Int?
    public let deliveryDate: String?
    public let orderNumber: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case total
        case deliveryDate = "delivery_date"
        case orderNumber = "order_number"
    }
}
