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
    
    @IBOutlet weak var case0501ImageView: UIImageView!
    @IBOutlet weak var case0502Label: UILabel!
    
    @IBOutlet weak var case06Label: UILabel!
    @IBOutlet weak var case07Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Case 01 : String
        case01Label.text = L10n.testCase01TitleTop01
        
        // Case 02 : String
        case02Label.text = TestCase02Strings.testCase02TitleTop01

        // Case 03 : String
        case03Label.text = TestCase03Strings.testCase03TitleBottom01
        
        // Case 04 : Storyboard
        // Pass
        
        // Case 05-1 : Assets
//        let swiftGenSample01Image = UIImage(asset: Asset.imageSwiftGenSample01)
        let swiftGenSample01Image = Asset.imageSwiftGenSample01.image
        case0501ImageView.image = swiftGenSample01Image
        debugPrint(Asset.allImages)
        
//        case0502Label.textColor = UIColor(asset: Asset.test01Color)
        case0502Label.textColor = Asset.test01Color.color
        debugPrint(Asset.allColors)
        
        // Case 06 : Colors
//        case06Label.textColor = Color(named:ColorName.articleBody)
        case06Label.textColor = ColorName.articleBody.color
        
        // Case 07 : Fonts
//        case06Label.font = UIFont(font: FontFamily.SFCompactDisplay.ultralight, size: 30.0)
        case07Label.font = UIFont(font: FontFamily.SFProDisplay.blackItalic, size: 30.0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

