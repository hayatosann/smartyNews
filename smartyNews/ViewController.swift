//
//  ViewController.swift
//  smartyNews
//
//  Created by hayatosann on 2019/09/12.
//  Copyright © 2019 hayatosann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pageMenu:CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var controllerArray : [UIViewController] = []
        
        let controller1:News1ViewController = News1ViewController()
        controller1.title = "トップ"
        controllerArray.append(controller1)
        
        let controller2:News2ViewController = News2ViewController()
        controller2.title = "エンタメ"
        controllerArray.append(controller2)
        
        let controller3:News3ViewController = News3ViewController()
        controller3.title = "スポーツ"
        controllerArray.append(controller3)
        
        let controller4:News4ViewController = News4ViewController()
        controller4.title = "グルメ"
        controllerArray.append(controller4)
        
        let controller5:News5ViewController = News5ViewController()
        controller5.title = "コラム"
        controllerArray.append(controller5)
        
        let parameters:[CAPSPageMenuOption] = [
            
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        
        //PageMenuのビューを親のビューに追加
        self.view.addSubview(pageMenu!.view)
        
        //PageMenuのビューをToolbarの後ろへ移動させた
        self.view.sendSubviewToBack(pageMenu!.view)
    }


}

