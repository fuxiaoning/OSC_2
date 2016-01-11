//
//  HomepageViewController.swift
//  OSC_2
//
//  Created by 付小宁 on 16/1/10.
//  Copyright © 2016年 Maizi. All rights reserved.
//

import UIKit

class HomepageViewController: UITabBarController {
    var newsViweCtl: NewsViewController?
    var hotNewsViewCtl: NewsViewController?
    var blogViewCtl: BlogsViewController?
    var hotBlogViewCtl: BlogsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*暂时简单初始化综合模块里几个子控制器*/
        // 资讯
        newsViweCtl = NewsViewController()
        newsViweCtl!.view.backgroundColor = UIColor.orangeColor()
        // 热门
        hotNewsViewCtl = NewsViewController()
        hotNewsViewCtl?.view.backgroundColor = UIColor.grayColor()
        // 博客
        blogViewCtl = BlogsViewController()
        blogViewCtl?.view.backgroundColor = UIColor.redColor()
        // 推荐
        hotBlogViewCtl = BlogsViewController()
        hotBlogViewCtl?.view.backgroundColor = UIColor.blueColor()
        
        // 综合
        let newsSVC: SwipableViewController = SwipableViewController().initWithTitle("综合", subTitles: ["资讯", "热点", "博客", "推荐"], controllers:  [newsViweCtl!, hotNewsViewCtl!, blogViewCtl!, hotBlogViewCtl!]) as! SwipableViewController
        let tweetsSVC:ViewController = ViewController()
       
        // 构建 TabBar 控制器
        self.viewControllers = [self.addNavigationItemForViewController(newsSVC),
            tweetsSVC]

        
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addNavigationItemForViewController(vController: UIViewController) -> UINavigationController {
        let navCtrl = UINavigationController.init(rootViewController: vController)
        
        vController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "navigationbar-sidebar"), style: UIBarButtonItemStyle.Plain, target: self, action: "onClickMenuButton")
        
        return navCtrl
    }
    
//    func onClickMenuButton() {
//        self.sideMenuViewController.presentLeftMenuViewController()
//    }
}
