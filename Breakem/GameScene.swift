//
//  GameScene.swift
//  Breakem
//
//  Created by Nikeeta Bajwa on 2015-10-20.
//  Copyright (c) 2015 Malcolm MacArthur. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var blueBlock:[SKSpriteNode] = []
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        var index : Int
        for index = 0; index < 5; ++index {
            blueBlock.append(self.childNodeWithName("BlueBlock_\(index)") as! SKSpriteNode)
            //blueBlock[index].xScale = 2
        }
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
