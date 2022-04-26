//
//  ResponseTest.swift
//  breaking-badTests
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import XCTest
@testable import breaking_bad

class ResponseTest: XCTestCase {

    func testRedditResponse() {
        
        let data = getJsonData(from: "response")
        
        var networkManager = FakeNetworkManager()
        networkManager.data = data
        
        
        let mv = ViewModel(networkManager: networkManager)
        
        mv.getCharacters()
        
        let models = mv.characters
        
        //  validation
        let totalChildren = models.count
        XCTAssertEqual(totalChildren, 62)
        
        let firstName = models.first?.name
        XCTAssertEqual(firstName, "Walter White")
        
        let occupationCounts = models.first?.occupation.count
        XCTAssertEqual(occupationCounts, 2)
        
        let status = models.first?.status
        XCTAssertEqual(status, "Presumed dead")
        
        let nickname = models.first?.nickname
        XCTAssertEqual(nickname, "Heisenberg")
        
        
        let seasonAppearance = models.first?.appearance
        XCTAssertEqual(seasonAppearance, [1,2,3,4,5])
        
    }
    
    private func getJsonData(from name: String) -> Data {
        // get data from json file
        let bundle = Bundle(for: ResponseTest.self)
        
        guard let file = bundle.url(forResource: name, withExtension: "json")
        else {            return Data() }
        
        do {
            return try Data(contentsOf: file)
        } catch {
            return Data()
        }
    }
    

}
