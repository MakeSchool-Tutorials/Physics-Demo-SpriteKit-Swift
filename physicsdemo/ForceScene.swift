//
//  ForceScene.swift
//  physicsdemo
//
//  Created by Martin Walsh on 07/06/2016.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

class ForceScene: SKScene {
    
    var node1: SKSpriteNode!
    var node2: SKSpriteNode!
    var node3: SKSpriteNode!
    
    var forceLabel1: SKLabelNode!
    var massLabel1: SKLabelNode!
    var velocityLabel1: SKLabelNode!
    
    var forceLabel2: SKLabelNode!
    var massLabel2: SKLabelNode!
    var velocityLabel2: SKLabelNode!
    
    var forceLabel3: SKLabelNode!
    var massLabel3: SKLabelNode!
    var velocityLabel3: SKLabelNode!
    
    var actionLabel: SKLabelNode!
    var actionButton: MSButtonNode!
    
    var running = false {
        didSet {
            if running {
                actionLabel.text = "Exit Demo"
                
                actionButton.selectedHandler =  {
                    let skView = self.view!
                    let scene = MainMenuScene(fileNamed:"MainMenuScene")!
                    scene.scaleMode = .aspectFit
                    skView.presentScene(scene)
                }
            }
        }
    }
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        node1 = self.childNode(withName: "node1") as! SKSpriteNode
        node1.physicsBody?.mass = 1

        node2 = self.childNode(withName: "node2") as! SKSpriteNode
        node2.physicsBody?.mass = 1

        node3 = self.childNode(withName: "node3") as! SKSpriteNode
        node3.physicsBody?.mass = 5

        forceLabel1 = self.childNode(withName: "forceLabel1") as! SKLabelNode
        massLabel1 = self.childNode(withName: "massLabel1") as! SKLabelNode
        velocityLabel1 = self.childNode(withName: "velocityLabel1") as! SKLabelNode
        
        forceLabel2 = self.childNode(withName: "forceLabel2") as! SKLabelNode
        massLabel2 = self.childNode(withName: "massLabel2") as! SKLabelNode
        velocityLabel2 = self.childNode(withName: "velocityLabel2") as! SKLabelNode
        
        forceLabel3 = self.childNode(withName: "forceLabel3") as! SKLabelNode
        massLabel3 = self.childNode(withName: "massLabel3") as! SKLabelNode
        velocityLabel3 = self.childNode(withName: "velocityLabel3") as! SKLabelNode
        
        actionButton = self.childNode(withName: "actionButton") as! MSButtonNode
        actionLabel = actionButton.childNode(withName: "actionLabel") as! SKLabelNode
        
        actionButton.selectedHandler = {
            self.running = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
        if running == false { return }
        
        node1.physicsBody?.applyForce(CGVector(dx: 25, dy: 0))
        velocityLabel1.text = String(format: "%.0f", node1.physicsBody!.velocity.length())
        
        node2.physicsBody?.applyForce(CGVector(dx: 125, dy: 0))
        velocityLabel2.text = String(format: "%.0f", node2.physicsBody!.velocity.length())
        
        node3.physicsBody?.applyForce(CGVector(dx: 125, dy: 0))
        velocityLabel3.text = String(format: "%.0f", node3.physicsBody!.velocity.length())
        
    }
    
}
