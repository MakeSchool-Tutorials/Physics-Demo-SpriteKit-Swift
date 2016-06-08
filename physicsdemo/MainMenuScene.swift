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
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        distanceButton = self.childNodeWithName("distanceButton") as! MSButtonNode
        distanceButton.selectedHandler =  {
            let skView = self.view as SKView!
            let scene = DistanceScene(fileNamed:"DistanceScene") as DistanceScene!
            skView.presentScene(scene)
        }
        
        velocityButton = self.childNodeWithName("velocityButton") as! MSButtonNode
        velocityButton.selectedHandler =  {
            let skView = self.view as SKView!
            let scene = VelocityScene(fileNamed:"VelocityScene") as VelocityScene!
            skView.presentScene(scene)
        }
        
        accelerationButton = self.childNodeWithName("accelerationButton") as! MSButtonNode
        accelerationButton.selectedHandler =  {
            let skView = self.view as SKView!
            let scene = AccelerationScene(fileNamed:"AccelerationScene") as AccelerationScene!
            skView.presentScene(scene)
        }
        
        forceButton = self.childNodeWithName("forceButton") as! MSButtonNode
        forceButton.selectedHandler =  {
            let skView = self.view as SKView!
            let scene = ForceScene(fileNamed:"ForceScene") as ForceScene!
            skView.presentScene(scene)
        }
        
        impulseButton = self.childNodeWithName("impulseButton") as! MSButtonNode
        impulseButton.selectedHandler =  {
            let skView = self.view as SKView!
            let scene = ImpulseScene(fileNamed:"ImpulseScene") as ImpulseScene!
            skView.presentScene(scene)
        }
        
        frictionButton = self.childNodeWithName("frictionButton") as! MSButtonNode
        frictionButton.selectedHandler =  {
            let skView = self.view as SKView!
            let scene = FrictionScene(fileNamed:"FrictionScene") as FrictionScene!
            skView.presentScene(scene)
        }
        
        restitutionButton = self.childNodeWithName("restitutionButton") as! MSButtonNode
        restitutionButton.selectedHandler =  {
            let skView = self.view as SKView!
            let scene = RestitutionScene(fileNamed:"RestitutionScene") as RestitutionScene!
            skView.presentScene(scene)
        }
        
        fieldButton = self.childNodeWithName("fieldButton") as! MSButtonNode
        fieldButton.selectedHandler =  {
            let skView = self.view as SKView!
            let scene = FieldScene(fileNamed:"FieldScene") as FieldScene!
            skView.presentScene(scene)
        }

    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }

}
