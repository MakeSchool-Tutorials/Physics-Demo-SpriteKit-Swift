//
//  ImpulseScene.swift
//  physicsdemo
//
//  Created by Martin Walsh on 07/06/2016.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

class ImpulseScene: SKScene {
    
    var node1: SKSpriteNode!
    var node2: SKSpriteNode!
    var node3: SKSpriteNode!
    
    var velocityLabel1: SKLabelNode!
    var velocityLabel2: SKLabelNode!
    var velocityLabel3: SKLabelNode!
    
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

        node2 = self.childNodeWithName("node2") as! SKSpriteNode
        node2.physicsBody?.mass = 1

        node3 = self.childNodeWithName("node3") as! SKSpriteNode
        node3.physicsBody?.mass = 5

        velocityLabel1 = self.childNodeWithName("velocityLabel1") as! SKLabelNode
        velocityLabel2 = self.childNodeWithName("velocityLabel2") as! SKLabelNode
        velocityLabel3 = self.childNodeWithName("velocityLabel3") as! SKLabelNode
        
        actionButton = self.childNodeWithName("actionButton") as! MSButtonNode
        actionLabel = actionButton.childNodeWithName("actionLabel") as! SKLabelNode
        
        actionButton.selectedHandler = {
            self.running = true
            
            self.node1.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 0))
            self.node2.physicsBody?.applyImpulse(CGVector(dx: 250, dy: 0))
            self.node3.physicsBody?.applyImpulse(CGVector(dx: 250, dy: 0))
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if running == false { return }
        
        velocityLabel1.text = String(format: "%.0f", node1.physicsBody!.velocity.length())
        velocityLabel2.text = String(format: "%.0f", node2.physicsBody!.velocity.length())
        velocityLabel3.text = String(format: "%.0f", node3.physicsBody!.velocity.length())
        
    }
    
}
