//
//  CATransform3D+Extension.swift
//  DesignKit
//
//  Created by Guluwa on 2021/8/31.
//

import QuartzCore
import CoreGraphics

// MARK: - Equatable

extension CATransform3D: Equatable {
    /// 用于判断2个变换是否一致
    /// - Parameters:
    ///   - lhs: 当前值
    ///   - rhs: 比较值
    /// - Returns: 比较结果
    @inlinable
    public static func == (lhs: CATransform3D, rhs: CATransform3D) -> Bool {
        CATransform3DEqualToTransform(lhs, rhs)
    }
}

// MARK: - 静态属性

public extension CATransform3D {
    // 变换初始值: [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
    @inlinable
    static var identity: CATransform3D { CATransform3DIdentity }
}

// MARK: - 构造器

public extension CATransform3D {
    /// 返回由`(tx, ty, tz)`构造一个平移变换
    /// - Parameters:
    ///   - tx: x方向坐标
    ///   - ty: y方向坐标
    ///   - tz: z方向坐标
    @inlinable
    init(translationX tx: CGFloat, y ty: CGFloat, z tz: CGFloat) {
        self = CATransform3DMakeTranslation(tx, ty, tz)
    }
    
    /// 返回由`(sx, sy, sz)`构造一个缩放变换
    /// - Parameters:
    ///   - sx: x方向缩放大小
    ///   - sy: y方向缩放大小
    ///   - sz: z方向缩放大小
    @inlinable
    init(scaleX sx: CGFloat, y sy: CGFloat, z sz: CGFloat) {
        self = CATransform3DMakeScale(sx, sy, sz)
    }
    
    /// 返回围绕向量`(x, y, z)`旋转`angle`角度的变换
    /// 如果向量长度为`0`则变换无效
    /// - Parameters:
    ///   - angle: 旋转角度
    ///   - x: 向量x坐标
    ///   - y: 向量y左边
    ///   - z: 向量z坐标
    @inlinable
    init(rotationAngle angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) {
        self = CATransform3DMakeRotation(angle, x, y, z)
    }
}

// MARK: - 属性

public extension CATransform3D {
    // 判断变换是否是初始值
    @inlinable
    var isIdentity: Bool { CATransform3DIsIdentity(self) }
}

// MARK: - 方法

public extension CATransform3D {
    /// 根据`(tx, ty, tz)`平移当前变换
    /// - Parameters:
    ///   - tx: x方向移动距离
    ///   - ty: y方向移动距离
    ///   - tz: z方向移动距离
    /// - Returns: 平移变换结果
    @inlinable
    func translatedBy(x tx: CGFloat, y ty: CGFloat, z tz: CGFloat) -> CATransform3D {
        CATransform3DTranslate(self, tx, ty, tz)
    }
    
    /// 根据`(sx, sy, sz)`缩放当前变换
    /// - Parameters:
    ///   - sx: x方向缩放大小
    ///   - sy: y方向缩放大小
    ///   - sz: z方向缩放大小
    /// - Returns: 缩放变换结果
    @inlinable
    func scaledBy(x sx: CGFloat, y sy: CGFloat, z sz: CGFloat) -> CATransform3D {
        CATransform3DScale(self, sx, sy, sz)
    }
    
    /// 围绕向量`(x, y, z)`旋转当前变换`angle`角度
    /// 如果向量长度为`0`则变换无效
    /// - Parameters:
    ///   - angle: 旋转角度
    ///   - x: 向量x坐标
    ///   - y: 向量y坐标
    ///   - z: 向量z坐标
    /// - Returns: 旋转变换结果
    @inlinable
    func rotated(by angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) -> CATransform3D {
        CATransform3DRotate(self, angle, x, y, z)
    }
    
    /// 翻转变换
    /// 如果当前变换没有翻转矩阵则返回他自己
    /// - Returns: 当前变换的翻转结果
    @inlinable
    func inverted() -> CATransform3D {
        CATransform3DInvert(self)
    }
    
    /// 拼接变换
    /// - Parameter t2: 拼接的变换
    /// - Returns: 拼接后的变换
    @inlinable
    func concatenating(_ t2: CATransform3D) -> CATransform3D {
        CATransform3DConcat(self, t2)
    }
    
    /// 根据`(tx, ty, tz)`平移当前变换
    /// - Parameters:
    ///   - tx: x方向移动距离
    ///   - ty: y方向移动距离
    ///   - tz: z方向移动距离
    @inlinable
    mutating func translateBy(x tx: CGFloat, y ty: CGFloat, z tz: CGFloat) {
        self = CATransform3DTranslate(self, tx, ty, tz)
    }
    
    /// 根据`(sx, sy, sz)`缩放当前变换
    /// - Parameters:
    ///   - sx: x方向缩放大小
    ///   - sy: y方向缩放大小
    ///   - sz: z方向缩放大小
    @inlinable
    mutating func scaleBy(x sx: CGFloat, y sy: CGFloat, z sz: CGFloat) {
        self = CATransform3DScale(self, sx, sy, sz)
    }
    
    /// 围绕向量`(x, y, z)`旋转当前变换`angle`角度
    /// 如果向量长度为`0`则变换无效
    /// - Parameters:
    ///   - angle: 旋转角度
    ///   - x: 向量x坐标
    ///   - y: 向量y坐标
    ///   - z: 向量z坐标
    @inlinable
    mutating func rotate(by angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) {
        self = CATransform3DRotate(self, angle, x, y, z)
    }
    
    /// 翻转变换
    /// 如果当前变换没有翻转矩阵则返回他自己
    @inlinable
    mutating func invert() {
        self = CATransform3DInvert(self)
    }
    
    /// 拼接变换
    /// - Parameter t2: 拼接的变换
    @inlinable
    mutating func concatenate(_ t2: CATransform3D) {
        self = CATransform3DConcat(self, t2)
    }
}

// MARK: - CGAffineTransform

public extension CATransform3D {
    // 是否是仿射变换
    @inlinable
    var isAffine: Bool { CATransform3DIsAffine(self) }
    
    /// 返回当前对象的仿射变换。
    /// 如果当前对象不能进行仿射变换则返回值无效
    /// - Returns: 仿射变换
    @inlinable
    func affineTransform() -> CGAffineTransform {
        CATransform3DGetAffineTransform(self)
    }
}
