//
//  MusicSearchTests.swift
//  MusicSearchTests
//
//  Created by MOSO33 on 2/17/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import XCTest
@testable import MusicSearch

class MusicSearchTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSongAPIReturns() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //Require refactoring(e.g. common SUT) to avoid duplication.
    //In acutal app this would be replaced by MOCK objects for collabrators to avoid actual service calls
    func test_FetchingForSongs_ReturnsExptedNumberOfSongs() {
        //given / setup
        let songAPI = SongAPIClientRest()
        let songParser = SongParseClientJson()
        let SUT = SongService(apiClient: songAPI, parser: songParser)
        
        //when/ excecute
        SUT.fetchSongs(searchTerm: "Frank's Wild Years") { serviceResult in
            switch serviceResult {
            case let .success(songs):
                //then //assert
                XCTAssertEqual(25, songs.count,"Counts are unecpected")
            case .error(SongServiceError.noSongsAvailable):
                print("No songs available")
            default:
                print("Other error")
            }
        }
    }
    
    //Require refactoring(e.g. common SUT) to avoid duplication.
    //In acutal app this would be replaced by MOCK objects for collabrators to avoid actual service calls
    func test_GettingSongs_ReturnsExptedFields() {
        //given
        let songAPI = SongAPIClientRest()
        let songParser = SongParseClientJson()
        let songService = SongService(apiClient: songAPI, parser: songParser)
        
        //when
        songService.fetchSongs(searchTerm: "Frank's Wild Years") { serviceResult in
            switch serviceResult {
            case let .success(songs):
                //then
                XCTAssertNotNil(songs[0].albumName, "Album name could not be nil")
                XCTAssertNotNil(songs[0].trackName, "Track name could not be nil")
                XCTAssertNotNil(songs[0].imageOfAlbum, "Image  could not be nil")
                XCTAssertNotNil(songs[0].artistName, "Artist name could not be nil")

            case .error(SongServiceError.noSongsAvailable):
                print("No songs available")
            default:
                print("Other error")
            }
        }
    }
}
