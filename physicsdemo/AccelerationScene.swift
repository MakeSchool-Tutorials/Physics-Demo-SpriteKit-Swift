//
//  AccelerationScene.swift
//  physicsdemo
//
//  Created by Martin Walsh on 07/06/2016.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

class AccelerationScene: SKScene {
    
    var node1: SKSpriteNode!
    var node2: SKSpriteNode!
    
    var accelerationLabel1: SKLabelNode!
    var velocityLabel1: SKLabelNode!
    var distanceLabel1: SKLabelNode!
    
    var accelerationLabel2: SKLabelNode!
    var velocityLabel2: SKLabelNode!
    var distanceLabel2: SKLabelNode!
    
    var node1Start = CGPoint.zero
    var node2Start = CGPoint.zero
    
    var distance1:CGFloat  = 0 {
        didSet {
            distanceLabel1.text = String(format: "%.0f", distance1)
        }
    }
    var distance2:CGFloat  = 0 {
        didSet {
            distanceLabel2.text = String(format: "%.0f", distance2)
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
                    scene?.scaleMode = .aspectFit
                    skView?.presentScene(scene)
                }
            }
        }
    }
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        node1 = self.childNode(withName: "node1") as! SKSpriteNode
        node1.physicsBody?.mass = 1
        node1Start = node1.position
        
        node2 = self.childNode(withName: "node2") as! SKSpriteNode
        node2.physicsBody?.mass = 1
        node2Start = node2.position
        
        accelerationLabel1 = self.childNode(withName: "accelerationLabel1") as! SKLabelNode
        velocityLabel1 = self.childNode(withName: "velocityLabel1") as! SKLabelNode
        distanceLabel1 = self.childNode(withName: "distanceLabel1") as! SKLabelNode
        
        accelerationLabel2 = self.childNode(withName: "accelerationLabel2") as! SKLabelNode
        velocityLabel2 = self.childNode(withName: "velocityLabel2") as! SKLabelNode
        distanceLabel2 = self.childNode(withName: "distanceLabel2") as! SKLabelNode
        
        actionButton = self.childNode(withName: "actionButton") as! MSButtonNode
        actionLabel = actionButton.childNode(withName: "actionLabel") as! SKLabelNode
        
        actionButton.selectedHandler = {
            self.running = true
            self.accelerationLabel1.text = "1"
            self.accelerationLabel2.text = "4"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
        if running == false { return }
        
        node1.physicsBody?.applyForce(CGVector(dx: 25, dy: 0))
        distance1 = node1.position.distanceTo(node1Start)
        velocityLabel1.text = String(format: "%.0f", node1.physicsBody!.velocity.length())
        
        node2.physicsBody?.applyForce(CGVector(dx: 100, dy: 0))
        distance2 = node2.position.distanceTo(node2Start)
        velocityLabel2.text = String(format: "%.0f", node2.physicsBody!.velocity.length())
        
    }
    
}
