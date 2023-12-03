//
//  ChannelListViewModelTests.swift
//  TVChannelListTests
//
//  Created by Roman Indermühle on 29.06.23.
//

import XCTest
@testable import TVChannelList

final class ChannelListViewModelTests: XCTestCase {

    func testmodifyLogoString() {
        //Given (Arrange)
        let item = ChannelList(name: "Test")
        let channelListViewModel = ChannelListViewModel(item: item)
//        let url = Bundle.main.url(forResource: "SampleChannelData", withExtension: "json")
        let logo = "https://services.sg101.prd.sctv.ch/content/images/tv/channel/2048_image_5_{resolution}.{fileType}"
        //When (Act)
        let modifiedString = channelListViewModel.modifyLogoString(logoString: logo)
        //Then (Assert)
        XCTAssertEqual(modifiedString, "https://services.sg101.prd.sctv.ch/content/images/tv/channel/2048_image_5_W90.png")
    }

}
