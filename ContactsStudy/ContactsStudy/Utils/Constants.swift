//
//  Constants.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import Foundation
import Contacts


struct Constants {
    static let baseUrl = URL(string: "http://api.alltheapps.org/weather/v3")!
    static let activeAlerts = "/allActiveAlerts"
    static let alertZone = "/alertZone"
    static let apiKey = "aa221028"
    static let imageUrl = URL(string: "https://picsum.photos/200")!
    
    static let contactKeys = [
        CNContactTypeKey,
        CNContactNamePrefixKey,
        CNContactGivenNameKey,
        CNContactMiddleNameKey,
        CNContactFamilyNameKey,
        CNContactPreviousFamilyNameKey,
        CNContactNameSuffixKey,
        CNContactNicknameKey,
        CNContactOrganizationNameKey,
        CNContactDepartmentNameKey,
        CNContactJobTitleKey,
        CNContactPhoneticGivenNameKey,
        CNContactPhoneticMiddleNameKey,
        CNContactPhoneticFamilyNameKey,
        CNContactPhoneticOrganizationNameKey,
        CNContactBirthdayKey,
        CNContactNonGregorianBirthdayKey,
        CNContactImageDataAvailableKey,
        CNContactImageDataKey,
        CNContactThumbnailImageDataKey,
        CNContactPhoneNumbersKey,
        CNContactEmailAddressesKey,
        CNContactPostalAddressesKey,
        CNContactDatesKey,
        CNContactUrlAddressesKey,
        CNContactRelationsKey,
        CNContactSocialProfilesKey,
        CNContactInstantMessageAddressesKey,

    ]
}
