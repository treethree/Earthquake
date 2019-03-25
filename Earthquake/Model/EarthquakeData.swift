//
//  EarthquakeData.swift
//  Earthquake
//
//  Created by SHILEI CUI on 3/25/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Foundation

struct Earthquake: Codable {
    let type: String
    let metadata: Metadata
    let features: [Feature]
    let bbox: [Double]
}

struct Feature: Codable {
    let type: FeatureType
    let properties: Properties
    let geometry: Geometry
    let id: String
}

struct Geometry: Codable {
    let type: GeometryType
    let coordinates: [Double]
}

enum GeometryType: String, Codable {
    case point = "Point"
}

struct Properties : Codable{
    let mag: Double
    let place: String
    let time, updated, tz: Int
    let url: String
    let detail: String
    let felt: Int?
    let cdi: Double?
    //let mmi, alert: JSONNull?
    let status: Status
    let tsunami, sig: Int
    let net: Net
    let code, ids: String
    let sources: Sources
    let types: Types
    //let nst: JSONNull?
    let dmin, rms: Double
    let gap: Int
    let magType: MagType
    let type: PropertiesType
    let title: String
}

enum MagType: String, Codable {
    case mb = "mb"
}

enum Net: String, Codable {
    case us = "us"
}

enum Sources: String, Codable {
    case akUs = ",ak,us,"
    case us = ",us,"
}

enum Status: String, Codable {
    case reviewed = "reviewed"
}

enum PropertiesType: String, Codable {
    case earthquake = "earthquake"
}

enum Types: String, Codable {
    case dyfiGeoserveOriginPhaseData = ",dyfi,geoserve,origin,phase-data,"
    case geoserveOriginPhaseData = ",geoserve,origin,phase-data,"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}

struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}
