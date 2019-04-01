//
//  OneInteractionResponse.swift
//  Content Orchestration Example
//
//  Created by Andrei Pop on 25/03/2019.
//  Copyright © 2019 Thunderhead. All rights reserved.
//  Generated using https://app.quicktype.io/
//

import Foundation

struct OneInteractionResponse: Codable {
    let statusCode: Int?
    let tid, session: String?
    let optimizations: [Optimization]?
}

struct Optimization: Codable {
    let data, path, dataMIMEType, directives: String?
    
    enum CodingKeys: String, CodingKey {
        case data, path
        case dataMIMEType = "dataMimeType"
        case directives
    }
}

struct OptimizationDataResponse: Codable {
    let actions: [Action]?
}

struct Action: Codable {
    let name: String?
    let asset: Asset?
    let proposition: Proposition?
}

struct Asset: Codable {
    let content, mimeType: String?
    let contentURL: String?
    let responses: [Response]?
    
    enum CodingKeys: String, CodingKey {
        case content, mimeType
        case contentURL = "contentUrl"
        case responses
    }
}

struct Response: Codable {
    let code, sentiment: String?
    let label, imageURL, targetURL, target: String?
    
    enum CodingKeys: String, CodingKey {
        case code, sentiment, label
        case imageURL = "imageUrl"
        case targetURL = "targetUrl"
        case target
    }
}

struct Proposition: Codable {
    let code: String?
}

struct OneAssetContentResponse: Codable {
    let type, headline, body: String?
    let image: String?
    let headlineColor, actionURL: String?
    
    enum CodingKeys: String, CodingKey {
        case type, headline, body, image
        case headlineColor = "headline_color"
        case actionURL = "action_url"
    }
}

struct OneOptimizationResponse {
    let optimization: Optimization
    let responses: [Response]
}
