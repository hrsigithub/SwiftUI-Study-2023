//
//  FetchTest.swift
//  SwiftUI-Study-2023Tests
//
//  Created by Hiroshi.Nakai on 2023/07/08.
//

import XCTest
@testable import SwiftUI_Study_2023

final class FetchTest: XCTestCase {

    func testGetUser() async throws {
        let userId = "hrsigithub"
        
        // Viewの中に関数があってもテスト可能
        // iPhone 14 Pro OK
        // iPhone X NG → シミュレータが起動してこないなぜ？
        // let v = GithubUserView()
        
        do {
            let user = try await getUser(userId: userId)
            XCTAssertEqual(user.login1, userId)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testGetUser2() async throws {
        let user = getUser2()
        
        XCTAssertNil(user)

        
    }

    
}
