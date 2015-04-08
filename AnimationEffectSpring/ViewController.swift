//
//  ViewController.swift
//  AnimationEffectSpring
//
//  Created by 渡部学 on 2015/04/06.
//  Copyright (c) 2015年 watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let moveView: UIView = UIView()
    let usingSpringWithDamping: UISlider = UISlider()
    let initialSpringVelocity: UISlider = UISlider()
    
    let usingSpringWithDampinglbl : UILabel = UILabel()
    let initialSpringVelocitylbl : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // アニメーション用のビュー
        self.moveView.frame =  CGRectMake(0, UIScreen.mainScreen().bounds.height / 3, 50, 50)
        self.moveView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.moveView)
        
        
        self.usingSpringWithDamping.frame =  CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 100, UIScreen.mainScreen().bounds.height - 230, 200, 50)
        self.usingSpringWithDamping.minimumValue = 0
        self.usingSpringWithDamping.maximumValue = 1
        self.usingSpringWithDamping.value = 0.5
        self.usingSpringWithDamping.addTarget(self, action: "changeUsingSpringWithDamping:", forControlEvents: UIControlEvents.ValueChanged)

        self.view.addSubview(self.usingSpringWithDamping)
        
        self.usingSpringWithDampinglbl.frame = CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 150, UIScreen.mainScreen().bounds.height - 260, 300, 50)
        self.usingSpringWithDampinglbl.text = "usingSpringWithDampinglbl:0.5"
        self.usingSpringWithDampinglbl.textAlignment = NSTextAlignment.Center
        self.view.addSubview(self.usingSpringWithDampinglbl)
        

        self.initialSpringVelocity.frame =  CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 100, UIScreen.mainScreen().bounds.height - 140, 200, 50)
        self.initialSpringVelocity.minimumValue = 0
        self.initialSpringVelocity.maximumValue = 1
        self.initialSpringVelocity.value = 0.5
        self.initialSpringVelocity.addTarget(self, action: "changeInitialSpringVelocity:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(self.initialSpringVelocity)
        
        self.initialSpringVelocitylbl.frame = CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 150, UIScreen.mainScreen().bounds.height - 170, 300, 50)
        self.initialSpringVelocitylbl.text = "initialSpringVelocitylbl:0.5"
        self.initialSpringVelocitylbl.textAlignment = NSTextAlignment.Center
        self.view.addSubview(self.initialSpringVelocitylbl)
        
        
        // バネ効果なし
        let btn: UIButton = UIButton(frame: CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 50, UIScreen.mainScreen().bounds.height - 60, 100, 50))
        btn.backgroundColor = UIColor.orangeColor()
        btn.setTitle("effect", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        btn.addTarget(self, action: "onClick:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func getSliderValue(val: Float) -> CGFloat {
        
        var result: Int = Int(val * 10)
        return CGFloat(result) / 10
        
    }
    
    func changeUsingSpringWithDamping(sender: AnyObject!) {
        self.usingSpringWithDampinglbl.text = "usingSpringWithDampinglbl:\(getSliderValue((sender as UISlider).value))"
    }
    
    func changeInitialSpringVelocity(sender: AnyObject!) {
        self.initialSpringVelocitylbl.text = "initialSpringVelocitylbl:\(getSliderValue((sender as UISlider).value))"
    }
    
    
    func onClick(sender: AnyObject!) {
        self.moveView.frame.origin.x = 0
        self.moveView.backgroundColor = UIColor.greenColor()
        
        UIView.animateWithDuration(
            1, // アニメーションの時間
            delay: 0.5,  // アニメーションの遅延時間
            usingSpringWithDamping: getSliderValue(self.usingSpringWithDamping.value), // スプリングの効果(0..1)
            initialSpringVelocity: getSliderValue(self.initialSpringVelocity.value),  // バネの初速。(0..1)
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = UIScreen.mainScreen().bounds.width / 2 // - self.moveView.frame.width
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.purpleColor()
        })
    }
}

