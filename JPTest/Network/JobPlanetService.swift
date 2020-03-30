//
//  JobPlanetService.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/28.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import Moya

public enum JobPlanetRouter {
    case basic
}

// MARK: - TargetType Protocol Implementation
extension JobPlanetRouter: TargetType {
    
    // 1
    public var baseURL: URL {
        return URL(string: "https://api-test-198703.appspot.com/")!
    }
    
    // 2
    public var path: String {
        switch self {
        case .basic:
            return ""
        }
    }
    
    // 3 : Use 'Moya.Method' as sometimes Xcode cannot find the Method namespace.
    public var method: Moya.Method {
        switch self {
        case .basic:
            return .get
        }
    }
    
    // 4 : Use for Unit Test
    public var sampleData: Data {
        switch self {
        case .basic:
            return Data()
        }
    }
    
    // 5 - Parameter 에 대한 처리가 들어간다.
    public var task: Task {
        switch self {
        case .basic: // Send no parameters
            return .requestPlain
        }
    }
    
    // 6
    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
    
}

// Just for convenience
private extension String {
    
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
}
