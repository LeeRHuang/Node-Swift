//
//  MainViewController.swift
//  Node-Swift
//
//  Created by 李日煌 on 2017/9/1.
//  Copyright © 2017年 TF. All rights reserved.
//

import UIKit
import PageMenu

class MainViewController: UIViewController,CAPSPageMenuDelegate {

    var pageMenu: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGlobalAppearance()
        setupPageMenu()
        // Do any additional setup after loading the view.
    }
    
    func setGlobalAppearance() {
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
    }
    
    func setupPageMenu() {
        //Create controllers
        var controllerArray : [UIViewController] = []
        let controller1 = TopicViewController()
        controller1.title = "话题"
        controllerArray.append(controller1)
        
        let controller2 = TopicViewController()
        controller2.title = "技术"
        controller2.view.backgroundColor = UIColor.red
        controllerArray.append(controller2)
        
        //Create page menu
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(1.0),
            .menuMargin(20.0),
            .menuHeight(40.0),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorRoundEdges(true),
            .selectionIndicatorHeight(2.0),
            .menuItemSeparatorPercentageHeight(0.5)
        ]
        
        let witdh = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame:CGRect(x:0,y:64,width:witdh,height:height) , pageMenuOptions: parameters)
        pageMenu?.delegate = self
        self.view.addSubview((pageMenu?.view)!)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
