//
//  Constants.swift
//  ZuperKit
//
//  Created by apple on 31/01/20.
//  Copyright © 2020 Zuper. All rights reserved.
//

import Foundation


//Constants


/// Endpoint type - live/staging
var endpointType: EndPoint = .staging

/// Accesstoken
var accessToken: String = ""

/// Store Id
var storeId: String = ""

/// Base endpoint
var wsApiUrlValue = ""

/// http method type - GET
let wsGET: String = "GET"
/// http method type - POST
let wsPOST: String = "POST"
/// http method type - PUT
let wsPUT: String = "PUT"
/// http method type - DELETE
let wsDELETE: String = "DELETE"
/// network request time
let wsTimeOutInterval = 60.0

/// EMPTY String
let EMPTY = ""



//MARK:- Service Names
enum ServiceName : String
{
    case socialLogin = "customer/social"
    case emailLogin = "customer/login"
    case emailSignUp = "customer/self"
    case customerDetails = "customer/self/details"
    case generateOtp = "customer/self/otp"
    case slider = "customer/store/slider/all?limit=10&offset=0"
    case storeId = "&store_id="
    case productGroupsAll = "customer/store/product/group/all?"
    case filterUrlSlug = "filter.url_slug="
    case productCategoriesAll = "customer/store/product/category/all?limit=1000&offset=1"
    case productCategories = "customer/store/product/category/bycategory"
    case getCartItems = "customer/store/cart/details"
    case getWishlist = "customer/wishlist"
    case deleteWishlist = "customer/wishlist/delete"
    case allProducts = "customer/store/product/all?offset=1&limit=1000"
    case allProductsLimit = "customer/store/product/all?offset=1&limit=200"
    case postCartItems = "customer/store/cart"
    case deliveryType = "customer/store/delivery_type/all?store_id="
    case deliverySlot = "customer/store/delivery_slot/all"
    case paymentMethod = "customer/store/details"
    case storeLocation = "customer/store/location/verify?store_id="
    case allStoreLocation = "customer/store/location/all?limit=10&offset=0&store_id="
    case pincode = "&pincode="
    case placeOrder = "customer/store/order"
    case createUpdateAddress = "customer/self/address"
    case storePages = "customer/store/page/all?"
    case orderList = "customer/store/order/all"
    case updatePhoneNo = "/phone"
    case allLocations = "customer/store/location/all?limit=10&offset=0"
    case trackOrder = "customer/store/order/location?order_id="
    case allSubscriptions = "customer/store/subscription/all?limit=10&offset=0"
    case mySubscriptions = "customer/subscription/all?limit=1000&offset=0"
    case myAllSubscriptions = "customer/subscription/all?filter.send_all=true&limit=1000&offset=0"
    case allSubscriptionDetails = "customer/store/subscription/details?id="
    case mySubscriptionDetails = "customer/subscription/details?id="
    case serviceRequest = "customer/subscription/request"
    case buypackage = "customer/store/subscription/order"
    case filterCustomerSubscription = "filter.customer_subscription_id="
    case passwordresetCode = "customer/password/reset"
    case passwordReset = "customer/password/update"
    case allPayments = "customer/store/payment/all"
    case payPartialPayment = "customer/store/payment"
    case productSlot = "customer/store/delivery_slot/check_validity?store_id="
    case productVariantId = "&product_variant_id="
    case slotDate = "&date="
    case pendingPaymentDetails = "customer/store/payment/details?store_payment_id="
}


/// URL Enum
enum wsUrl:Int
{
    case slider = 1
    case allCategory = 2
    case topDeal = 3
    case bestSeller = 4
    case customerDetails = 7
    case postCartList = 5
    case cartList = 6
    case allProducts = 8
    case wishList = 9
    case postWishList = 10
    case deliveryType = 11
    case deliverySlot = 12
    case paymentMethod = 13
    case placeOrder = 14
    case createOrUpdateAddress = 15
    case storePages = 16
    case deleteWishList = 17
    case orderList = 18
    case productCollection = 19
    case changePassword = 20
    case categories = 21
    case locationsAll = 22
    case trackOrder = 23
    case mySubscriptionList = 24
    case mySubscriptionDetails = 25
    case packagesAll = 26
    case packageDetail = 27
    case buyPackage = 28
    case requestService = 29
    case allPayment = 30
    case paymentDetails = 31
    case payPartialPayment = 32
    case resetCode = 33
    case resetPassword = 34
    case productSlot = 35
    case payPartialPaymentDetails = 36
    case myAllSubscriptionList = 37
    case signUp = 38
    case updatePhoneNo = 39
}

//MARK:- URL Generation
func generateURL(type: wsUrl) -> String
{
    if type == wsUrl.signUp{
        return wsApiUrlValue + ServiceName.emailSignUp.rawValue
    }
    else if type == wsUrl.updatePhoneNo
    {
        return wsApiUrlValue + ServiceName.emailSignUp.rawValue + ServiceName.updatePhoneNo.rawValue
    }
    else if type == wsUrl.slider
    {
        //Get Slider
        return wsApiUrlValue + ServiceName.slider.rawValue + ServiceName.storeId.rawValue + storeId
    }
    else if type == wsUrl.allCategory
    {
        //Get all categories
        return wsApiUrlValue + ServiceName.productCategoriesAll.rawValue + ServiceName.storeId.rawValue + storeId
    }
    else if type == wsUrl.categories
    {
        //Get all categories
        return wsApiUrlValue + ServiceName.productCategories.rawValue + "?store_id=" + storeId
    }
    else if type == wsUrl.topDeal
    {
        //Top Deal
        return wsApiUrlValue + ServiceName.productGroupsAll.rawValue + ServiceName.filterUrlSlug.rawValue + URLSlug.topDeal + ServiceName.storeId.rawValue + storeId
    }
    else if type == wsUrl.bestSeller
    {
        //Top bestSeller
        return wsApiUrlValue + ServiceName.productGroupsAll.rawValue + ServiceName.filterUrlSlug.rawValue + URLSlug.bestSellers + ServiceName.storeId.rawValue + storeId
    }
    else if type == wsUrl.cartList
    {
        return wsApiUrlValue + ServiceName.getCartItems.rawValue
    }
    else if type == wsUrl.customerDetails
    {
        return wsApiUrlValue + ServiceName.customerDetails.rawValue
    }
    else if type == wsUrl.allProducts
    {
        return wsApiUrlValue + ServiceName.allProducts.rawValue + ServiceName.storeId.rawValue + storeId
    }
    else if type == wsUrl.wishList
    {
        return wsApiUrlValue + ServiceName.getWishlist.rawValue
    }
    else if type == wsUrl.postCartList
    {
        return wsApiUrlValue + ServiceName.postCartItems.rawValue
    }
    else if type == wsUrl.postWishList
    {
        return wsApiUrlValue + ServiceName.getWishlist.rawValue
    }
    else if type == wsUrl.deleteWishList
    {
        return wsApiUrlValue + ServiceName.deleteWishlist.rawValue
    }
    else if type == wsUrl.deliveryType
    {
        return wsApiUrlValue + ServiceName.deliveryType.rawValue + storeId
    }
    else if type == wsUrl.deliverySlot
    {
        return wsApiUrlValue + ServiceName.deliverySlot.rawValue
    }
    else if type == wsUrl.paymentMethod
    {
        return wsApiUrlValue + ServiceName.paymentMethod.rawValue
    }
    else if type == wsUrl.placeOrder
    {
        return wsApiUrlValue + ServiceName.placeOrder.rawValue
    }
    else if type == wsUrl.createOrUpdateAddress
    {
        return wsApiUrlValue + ServiceName.createUpdateAddress.rawValue
    }
    else if type == wsUrl.storePages
    {
        return wsApiUrlValue + ServiceName.storePages.rawValue + ServiceName.storeId.rawValue + storeId + "&" + ServiceName.filterUrlSlug.rawValue
    }
    else if type == wsUrl.orderList
    {
        return wsApiUrlValue + ServiceName.orderList.rawValue
    }
    else if type == wsUrl.productCollection
    {
        return wsApiUrlValue + ServiceName.productGroupsAll.rawValue + ServiceName.storeId.rawValue + storeId + "&filter.product_group_id="
    }
    else if type == wsUrl.changePassword
    {
        return wsApiUrlValue + ServiceName.emailSignUp.rawValue
    }
    else if type == wsUrl.locationsAll
    {
        return wsApiUrlValue + ServiceName.allLocations.rawValue + ServiceName.storeId.rawValue + storeId
    }
    else if type == wsUrl.trackOrder
    {
        return wsApiUrlValue + ServiceName.trackOrder.rawValue
    }
    else if type == wsUrl.mySubscriptionList
    {
        return wsApiUrlValue + ServiceName.mySubscriptions.rawValue
    }
    else if type == wsUrl.myAllSubscriptionList
    {
        return wsApiUrlValue + ServiceName.myAllSubscriptions.rawValue
    }
    else if type == wsUrl.mySubscriptionDetails
    {
        return wsApiUrlValue + ServiceName.mySubscriptionDetails.rawValue
    }
    else if type == wsUrl.packagesAll
    {
        return wsApiUrlValue + ServiceName.allSubscriptions.rawValue
    }
    else if type == wsUrl.packageDetail
    {
        return wsApiUrlValue + ServiceName.allSubscriptionDetails.rawValue
    }
    else if type == wsUrl.buyPackage
    {
        return wsApiUrlValue + ServiceName.buypackage.rawValue
    }
    else if type == wsUrl.requestService
    {
        return wsApiUrlValue + ServiceName.serviceRequest.rawValue
    }
    else if type == wsUrl.allPayment
    {
        return wsApiUrlValue + ServiceName.allPayments.rawValue + "?filter.status=AWAIT_PAYMENT"
    }
    else if type == wsUrl.payPartialPayment
    {
        /// Partial payment
        return wsApiUrlValue + ServiceName.payPartialPayment.rawValue
    }
    else if type == wsUrl.resetCode
    {
        ///Forget password
        return wsApiUrlValue + ServiceName.passwordresetCode.rawValue
    }
    else if type == wsUrl.resetPassword
    {
        ///Password Reset
        return wsApiUrlValue + ServiceName.passwordReset.rawValue
    }
    else if type == wsUrl.productSlot
    {
        ///Product Slot
        return wsApiUrlValue + ServiceName.productSlot.rawValue
    }
    else if type == wsUrl.payPartialPaymentDetails
    {
        //Get Slider
        return wsApiUrlValue + ServiceName.pendingPaymentDetails.rawValue
    }
    return ""
}



/// URL Slugs
struct URLSlug
{
    static let bestSellers = "best_sellers"
    static let topDeal = "top-deal"
    static let faq = "faq"
    static let aboutUs = "about-us"
    static let termsCondition = "terms-conditions"
    static let privacyPolicy = "privacy-policy"
    static let cancellationPolicy = "cancellation-policy"
    static let contactUs = "mobile-contact-us"
    static let OneTimeService  = "one-time-service-terms"
    static let AMCTermsConditions = "amc-terms-conditions"
    
}

