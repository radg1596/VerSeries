//
//  SeriesTests.swift
//  SeriesTests
//
//  Created by Ricardo Desiderio on 10/18/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import XCTest
@testable import Series

class SeriesTests: XCTestCase {
    //De alguna manera evitar el unwraping nil del url

    func testGetSeriesFuncCaseA() {
        SeriesService.shared.getSeries(query: "walking") { (series) in
            XCTAssertNotNil(series, "Series found")
        }
    }
    func testGetSeriesFuncCaseB() {
        SeriesService.shared.getSeries(query: "cddgdfjgjdfghdfhjgjdf") { (series) in
            XCTAssertNil(series, "No series found")
        }
    }
    func testGetEpisodesFuncCaseA(){
        SeriesService.shared.getEpisodes(serieID: "2") { (episodes) in
            XCTAssertNotNil(episodes, "Episodes found")
        }
    }
    func testGetEpisodesFuncCaseB(){
        SeriesService.shared.getEpisodes(serieID: "$") { (episodes) in
            XCTAssertNil(episodes, "Episodes not found")
        }
    }
    

}
