//
//  DistanceScene.swift
//  physicsdemo
//
//  Created by Martin Walsh on 07/06/2016.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

class DistanceScene: SKScene {
    
    var node1: SKSpriteNode!
    
    var distanceLabel1: SKLabelNode!
    
    var node1Start = CGPointZero
    
    var distance1:CGFloat  = 0 {
        didSet {
            distanceLabel1.text = String(format: "%.0f", distance1)
        }
    }
    
    var actionLabel: SKLabelNode!
    var actionButton: MSButtonNode!
    
    var running = false {
        didSet {
            if running {
                actionLabel.text = "Exit Demo"
                
                actionButton.selectedHandler =  {
                    let skView = self.view as SKView!
                    let scene = MainMenuScene(fileNamed:"MainMenuScene") as MainMenuScene!
                    skView.presentScene(scene)
                }
            }
        }
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        node1 = self.childNodeWithName("node1") as! SKSpriteNode
        node1.physicsBody?.mass = 1
        node1Start = node1.position
        
        distanceLabel1 = self.childNodeWithName("distanceLabel1") as! SKLabelNode
        
        actionButton = self.childNodeWithName("actionButton") as! MSButtonNode
        actionLabel = actionButton.childNodeWithName("actionLabel") as! SKLabelNode
        
        actionButton.selectedHandler = {
            self.running = true
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if running == false { return }
        
        node1.physicsBody?.velocity = CGVector(dx: 25, dy: 0)
        distance1 = node1.position.distanceTo(node1Start)
    }
    
}
