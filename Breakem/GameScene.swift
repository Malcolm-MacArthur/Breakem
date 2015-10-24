//
//  GameScene.swift
//  Breakem
//
//  Created by Nikeeta Bajwa on 2015-10-20.
//  Copyright (c) 2015 Malcolm MacArthur. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let blueBlock = [SKSpriteNode](count: 4, repeatedValue: self.childNodeWithName("BlueBlock") as! SKSpriteNode)
        blueBlock[0].xScale = 2
        blueBlock[1].xScale = 0.5
        blueBlock[2].xScale = 2
        blueBlock[3].xScale = 2
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)

        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
