//
//  MainMenuScene.swift
//  physicsdemo
//
//  Created by Martin Walsh on 08/06/2016.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    var velocityButton: MSButtonNode!
    var distanceButton: MSButtonNode!
    var accelerationButton: MSButtonNode!
    var forceButton: MSButtonNode!
    var impulseButton: MSButtonNode!
    var frictionButton: MSButtonNode!
    var restitutionButton: MSButtonNode!
    var fieldButton: MSButtonNode!
    var jointButton: MSButtonNode!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        distanceButton = self.childNode(withName: "distanceButton") as! MSButtonNode
        distanceButton.selectedHandler =  {
            let skView = self.view!
            let scene = DistanceScene(fileNamed:"DistanceScene")!
            scene.scaleMode = .aspectFit
            skView.presentScene(scene)
        }
        
        velocityButton = self.childNode(withName: "velocityButton") as! MSButtonNode
        velocityButton.selectedHandler =  {
            let skView = self.view!
            let scene = VelocityScene(fileNamed:"VelocityScene")!
            scene.scaleMode = .aspectFit
            skView.presentScene(scene)
        }
        
        accelerationButton = self.childNode(withName: "accelerationButton") as! MSButtonNode
        accelerationButton.selectedHandler =  {
            let skView = self.view!
            let scene = AccelerationScene(fileNamed:"AccelerationScene")!
            scene.scaleMode = .aspectFit
            skView.presentScene(scene)
        }
        
        forceButton = self.childNode(withName: "forceButton") as! MSButtonNode
        forceButton.selectedHandler =  {
            let skView = self.view!
            let scene = ForceScene(fileNamed:"ForceScene")!
            scene.scaleMode = .aspectFit
            skView.presentScene(scene)
        }
        
        impulseButton = self.childNode(withName: "impulseButton") as! MSButtonNode
        impulseButton.selectedHandler =  {
            let skView = self.view!
            let scene = ImpulseScene(fileNamed:"ImpulseScene")!
            scene.scaleMode = .aspectFit
            skView.presentScene(scene)
        }
        
        frictionButton = self.childNode(withName: "frictionButton") as! MSButtonNode
        frictionButton.selectedHandler =  {
            let skView = self.view!
            let scene = FrictionScene(fileNamed:"FrictionScene")!
            scene.scaleMode = .aspectFit
            skView.presentScene(scene)
        }
        
        restitutionButton = self.childNode(withName: "restitutionButton") as! MSButtonNode
        restitutionButton.selectedHandler =  {
            let skView = self.view!
            let scene = RestitutionScene(fileNamed:"RestitutionScene")!
            scene.scaleMode = .aspectFit
            skView.presentScene(scene)
        }
        
        fieldButton = self.childNode(withName: "fieldButton") as! MSButtonNode
        fieldButton.selectedHandler =  {
            let skView = self.view!
            let scene = FieldScene(fileNamed:"FieldScene")!
            scene.scaleMode = .aspectFit
            skView.presentScene(scene)
        }
        
        jointButton = self.childNode(withName: "jointButton") as! MSButtonNode
        jointButton.selectedHandler =  {
            let skView = self.view!
            let scene = JointScene(fileNamed:"JointScene")!
            scene.scaleMode = .aspectFit
            
            /* Show debug */
            skView.showsPhysics = true
            skView.presentScene(scene)
        }


    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }

}
