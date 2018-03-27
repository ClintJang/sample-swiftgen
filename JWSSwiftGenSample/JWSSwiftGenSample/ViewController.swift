//
//  ViewController.swift
//  JWSSwiftGenSample
//
//  Created by Clint on 2018. 2. 23..
//  Copyright © 2018년 clint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var case01Label: UILabel!
    @IBOutlet weak var case02Label: UILabel!
    @IBOutlet weak var case03Label: UILabel!
    
    @IBOutlet weak var case05ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Case 01
        case01Label.text = L10n.testCase01TitleTop01
        
        // Case 02
        case02Label.text = TestCase02Strings.testCase02TitleTop01

        // Case 03
        case03Label.text = TestCase03Strings.testCase03TitleBottom01
        
        // Case 04
        // Pass
        
        // Case 05
        let swiftGenSample01Image = UIImage(asset: Asset.imageSwiftGenSample01)
        case05ImageView.image = swiftGenSample01Image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

