//
//  Event.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2020/12/14.
//

import Foundation

import Foundation

struct Event: Decodable, Identifiable {
    var id: Int
    var title: String
    var eventUrl: String
    var hashTag: String
    var startDate: String
    var address: String
    var ownerDisplayName: String

    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title = "title"
        case eventUrl = "event_url"
        case hashTag = "hash_tag"
        case startDate = "started_at"
        case address = "address"
        case ownerDisplayName = "owner_display_name"
    }
}
