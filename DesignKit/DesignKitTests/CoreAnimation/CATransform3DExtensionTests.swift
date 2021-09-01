//
//  CATransform3DExtensionTests.swift
//  DesignKitTests
//
//  Created by mac on 2021/9/1.
//

@testable import DesignKit
import XCTest
import CoreGraphics

class CATransform3DExtensionTests: XCTestCase {
    let x: CGFloat = 5
    let y: CGFloat = 10
    let z: CGFloat = 20
    let angle = CGFloat.pi / 3
    
    var translation: CATransform3D { CATransform3DMakeTranslation(x, y, z) }
    var scale: CATransform3D { CATransform3DMakeScale(x, y, z) }
    var rotation: CATransform3D { CATransform3DMakeRotation(angle, x, y, z) }
    
    func testIdentity() {
        XCTAssertEqual(CATransform3D.identity, CATransform3DIdentity)
        XCTAssertNotEqual(translation, CATransform3D.identity)
        XCTAssertNotEqual(scale, CATransform3D.identity)
        XCTAssertNotEqual(rotation, CATransform3D.identity)
    }
    
    func testInitTranslation() {
        XCTAssertEqual(CATransform3D(translationX: x, y: y, z: z), translation)
    }
    
    func testInitScale() {
        XCTAssertEqual(CATransform3D(scaleX: x, y: y, z: z), scale)
    }
    
    func testInitRotation() {
        XCTAssertEqual(CATransform3D(rotationAngle: angle, x: x, y: y, z: z), rotation)
    }
    
    func testIsIdentity() {
        XCTAssert(CATransform3DIdentity.isIdentity)
        XCTAssertFalse(translation.isIdentity)
        XCTAssertFalse(scale.isIdentity)
        XCTAssertFalse(rotation.isIdentity)
    }
    
    func testTranslated() {
        XCTAssertEqual(CATransform3DIdentity.translatedBy(x: x, y: y, z: z), translation)
    }
    
    func testScaled() {
        XCTAssertEqual(CATransform3DIdentity.scaledBy(x: x, y: y, z: z), scale)
    }
    
    func testInitRotated() {
        XCTAssertEqual(CATransform3DIdentity.rotated(by: angle, x: x, y: y, z: z), rotation)
    }
    
    func testInverted() {
        XCTAssertEqual(CATransform3DIdentity, CATransform3DIdentity.inverted())
        XCTAssertEqual(translation.inverted(), CATransform3DInvert(translation))
        XCTAssertEqual(translation.inverted(), CATransform3DInvert(translation))
        XCTAssertEqual(translation.inverted(), CATransform3DInvert(translation))
    }
    
    func testConcatenated() {
        XCTAssertEqual(translation, CATransform3DIdentity.concatenating(translation))
        XCTAssertEqual(scale, CATransform3DIdentity.concatenating(scale))
        XCTAssertEqual(rotation, CATransform3DIdentity.concatenating(rotation))
    }
    
    func testTranslate() {
        var transform = CATransform3DIdentity
        transform.translateBy(x: x, y: y, z: z)
        XCTAssertEqual(transform, translation)
    }
    
    func testScale() {
        var transform = CATransform3DIdentity
        transform.scaleBy(x: x, y: y, z: z)
        XCTAssertEqual(transform, scale)
    }
    
    func testRotate() {
        var transform = CATransform3DIdentity
        transform.rotate(by: angle, x: x, y: y, z: z)
        XCTAssertEqual(transform, rotation)
    }
    
    func testInvert() {
        var transform = CATransform3DIdentity
        transform.invert()
        XCTAssertEqual(transform, CATransform3DIdentity)
        
        transform = translation
        transform.invert()
        XCTAssertEqual(transform, CATransform3DInvert(translation))
        
        transform = scale
        transform.invert()
        XCTAssertEqual(transform, CATransform3DInvert(scale))
        
        transform = rotation
        transform.invert()
        XCTAssertEqual(transform, CATransform3DInvert(rotation))
    }
    
    func testConcatenate() {
        var transfrom = CATransform3DIdentity
        transfrom.concatenate(translation)
        XCTAssertEqual(transfrom, translation)
        
        transfrom = CATransform3DIdentity
        transfrom.concatenate(scale)
        XCTAssertEqual(transfrom, scale)
        
        transfrom = CATransform3DIdentity
        transfrom.concatenate(rotation)
        XCTAssertEqual(transfrom, rotation)
    }
    
    func testIsAffine() {
        XCTAssert(CATransform3DIdentity.isAffine)
        XCTAssertFalse(CATransform3DMakeTranslation(0, 0, 1).isAffine)
    }
    
    func testAffineTransform() {
        XCTAssertEqual(CATransform3DIdentity.affineTransform(), CGAffineTransform.identity)
        XCTAssertEqual(CATransform3DMakeTranslation(x, y, 1).affineTransform(), CGAffineTransform(translationX: x, y: y))
    }
}
