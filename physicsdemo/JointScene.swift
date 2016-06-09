//
//  JointScene.swift
//  physicsdemo
//
//  Created by Martin Walsh on 07/06/2016.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

class JointScene: SKScene {
    
    var node1: SKSpriteNode!
    var node2: SKSpriteNode!
    var node3: SKSpriteNode!
    
    var node4: SKSpriteNode!
    var node5: SKSpriteNode!
    var node6: SKSpriteNode!

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
        node1.physicsBody?.mass = 0.1

        node2 = self.childNodeWithName("node2") as! SKSpriteNode
        node2.physicsBody?.mass = 0.1

        node3 = self.childNodeWithName("node3") as! SKSpriteNode
        node3.physicsBody?.mass = 0.1
        
        node4 = self.childNodeWithName("node4") as! SKSpriteNode
        
        node5 = self.childNodeWithName("node5") as! SKSpriteNode
        
        node6 = self.childNodeWithName("node6") as! SKSpriteNode
        
        actionButton = self.childNodeWithName("actionButton") as! MSButtonNode
        actionLabel = actionButton.childNodeWithName("actionLabel") as! SKLabelNode
        
        /* Spring joint catapult arm and cantilever node */
        let catapultSpringJoint1_4 = SKPhysicsJointSpring.jointWithBodyA(node1.physicsBody!, bodyB: node4.physicsBody!, anchorA: node1.position, anchorB: node4.position)
        catapultSpringJoint1_4.damping = 0
        catapultSpringJoint1_4.frequency = 0.6
        physicsWorld.addJoint(catapultSpringJoint1_4)
        
        let catapultSpringJoint2_5 = SKPhysicsJointSpring.jointWithBodyA(node2.physicsBody!, bodyB: node5.physicsBody!, anchorA: node2.position, anchorB: node5.position)
        catapultSpringJoint2_5.damping = 0
        catapultSpringJoint2_5.frequency = 0.8
        physicsWorld.addJoint(catapultSpringJoint2_5)
        
        let catapultSpringJoint3_6 = SKPhysicsJointSpring.jointWithBodyA(node3.physicsBody!, bodyB: node6.physicsBody!, anchorA: node3.position, anchorB: node6.position)
        catapultSpringJoint3_6.damping = 0.1
        catapultSpringJoint3_6.frequency = 0.8
        physicsWorld.addJoint(catapultSpringJoint3_6)
        
        actionButton.selectedHandler = {
            self.running = true
            self.paused = false
            
        }
        
        self.paused = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if running == false { return }

    }
    
}
