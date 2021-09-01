//
//  CAGradientLayerExtensionTests.swift
//  DesignKitTests
//
//  Created by mac on 2021/9/1.
//

@testable import DesignKit
import XCTest

final class CAGradientLayerExtensionTests: XCTestCase {
    func testInitWithGradientAttributes() {
        let colors: [Color] = [.red, .blue, .orange, .yellow]
        let locations: [CGFloat]? = [0, 0.3, 0.6, 1]
        let startPoint = CGPoint(x: 0.0, y: 0.5)
        let endPoint = CGPoint(x: 1.0, y: 0.5)
        let gradientLayerType = CAGradientLayerType.axial
        
        let gradientLayer = CAGradientLayer(colors: colors, locations: locations, startPoint: startPoint, endPoint: endPoint, type: gradientLayerType)
        
        XCTAssertEqual(gradientLayer.colors?.count, colors.count)
        XCTAssertEqual(gradientLayer.locations as? [CGFloat] , locations)
        XCTAssertEqual(gradientLayer.startPoint, startPoint)
        XCTAssertEqual(gradientLayer.endPoint, endPoint)
        XCTAssertEqual(gradientLayer.type, gradientLayerType)
    }
}
