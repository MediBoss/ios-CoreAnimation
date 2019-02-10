//
//  ViewController.swift
//  LoadingView
//
//  Created by Medi Assumani on 2/9/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        let center = view.center
        
        
        // create track layer that trails behind the line stroke
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath // adds a path on the outer bounds of the CAShapeLayer object
        trackLayer.lineWidth = 10 // sets the width of the stroke line
        shapeLayer.strokeEnd = 0
        trackLayer.fillColor = UIColor.clear.cgColor // makes the circle clear so we only see the stroke line
        trackLayer.strokeColor = UIColor.lightGray.cgColor // sets the color of the path's stroke
        trackLayer.lineCap = CAShapeLayerLineCap.round // makes the line's stroke rounded
        view.layer.addSublayer(trackLayer)
        
        
         // Initializing and setting up a shape (circle)
        shapeLayer.path = circularPath.cgPath // adds a path on the outer bounds of the CAShapeLayer object
        shapeLayer.lineWidth = 10 // sets the width of the stroke line
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor // makes the circle clear so we only see the stroke line
        shapeLayer.strokeColor = UIColor.green.cgColor // sets the color of the path's stroke
        shapeLayer.lineCap = CAShapeLayerLineCap.round // makes the line's stroke rounded
        
        // adding on the main layer
        view.layer.addSublayer(shapeLayer)
        
        // adding a tap gesture recognizer
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc private func handleTap(){
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd") // initialize a new basic animation object
        basicAnimation.toValue = 1 // idk what this does tbh
        basicAnimation.duration = 2 // sets the duration of the animation in seconds
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards // fills up the things i think
        basicAnimation.isRemovedOnCompletion = false // makes sure the animation stays there after completed
        shapeLayer.add(basicAnimation, forKey: "basicAnimation") // must add the animation in oout shape layer object
    }


}

