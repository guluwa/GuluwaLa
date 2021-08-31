//
//  CAGradientLayer+Extension.swift
//  DesignKit
//
//  Created by mac on 2021/8/31.
//

import QuartzCore

// MARK: - 构造器

public extension CAGradientLayer {
    /// 创建具有指定颜色、位置、起点、终点和类型的 CAGradientLayer
    /// - Parameters:
    ///   - colors: 颜色数组
    ///   - locations: 位置数组
    ///   - startPoint: 起点
    ///   - endPoint: 终点
    ///   - type: 渐变类型
    convenience init(colors: [Color],
                     locations: [CGFloat]? = nil,
                     startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
                     endPoint: CGPoint = CGPoint(x: 0.5, y: 1),
                     type: CAGradientLayerType = .axial) {
        self.init()
        self.colors = colors.map(\.cgColor)
        self.locations = locations?.map { NSNumber(value: Double($0)) }
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.type = type
    }
}
