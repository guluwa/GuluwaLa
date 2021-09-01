//
//  ViewController.swift
//  GuluwaLa
//
//  Created by Guluwa on 2021/8/30.
//

import UIKit
import DesignKit

class ViewController: UIViewController {
    
    lazy var testView: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(testView)
    }
}
