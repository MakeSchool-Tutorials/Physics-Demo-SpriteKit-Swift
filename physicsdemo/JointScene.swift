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
        node1.physicsBody?.mass = 0.1

        node2 = self.childNode(withName: "node2") as! SKSpriteNode
        node2.physicsBody?.mass = 0.1

        node3 = self.childNode(withName: "node3") as! SKSpriteNode
        node3.physicsBody?.mass = 0.1
        
        node4 = self.childNode(withName: "node4") as! SKSpriteNode
        
        node5 = self.childNode(withName: "node5") as! SKSpriteNode
        
        node6 = self.childNode(withName: "node6") as! SKSpriteNode
        
        actionButton = self.childNode(withName: "actionButton") as! MSButtonNode
        actionLabel = actionButton.childNode(withName: "actionLabel") as! SKLabelNode
        
        /* Spring joint catapult arm and cantilever node */
        let catapultSpringJoint1_4 = SKPhysicsJointSpring.joint(withBodyA: node1.physicsBody!, bodyB: node4.physicsBody!, anchorA: node1.position, anchorB: node4.position)
        catapultSpringJoint1_4.damping = 0
        catapultSpringJoint1_4.frequency = 0.6
        physicsWorld.add(catapultSpringJoint1_4)
        
        let catapultSpringJoint2_5 = SKPhysicsJointSpring.joint(withBodyA: node2.physicsBody!, bodyB: node5.physicsBody!, anchorA: node2.position, anchorB: node5.position)
        catapultSpringJoint2_5.damping = 0
        catapultSpringJoint2_5.frequency = 0.8
        physicsWorld.add(catapultSpringJoint2_5)
        
        let catapultSpringJoint3_6 = SKPhysicsJointSpring.joint(withBodyA: node3.physicsBody!, bodyB: node6.physicsBody!, anchorA: node3.position, anchorB: node6.position)
        catapultSpringJoint3_6.damping = 0.1
        catapultSpringJoint3_6.frequency = 0.8
        physicsWorld.add(catapultSpringJoint3_6)
        
        actionButton.selectedHandler = {
            self.running = true
            self.isPaused = false
            
        }
        
        self.isPaused = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
        if running == false { return }

    }
    
}
