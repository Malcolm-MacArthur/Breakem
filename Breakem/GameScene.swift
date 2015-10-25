//
//  GameScene.swift
//  Breakem
//
//  Created by Nikeeta Bajwa on 2015-10-20.
//  Copyright (c) 2015 Malcolm MacArthur. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var blueBlock:[SKSpriteNode] = []
    var boundary:[SKSpriteNode] = []
    var ball = SKSpriteNode()
    var paddle = SKSpriteNode()
    let ballCategory :UInt32 = 0x1 << 0
    var BBCategory :[UInt32] = []
    let boundaryCategory :UInt32 = 0x1 << 2
    let paddleCategory :UInt32 = 0x1 << 3
    var index : Int = 0
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        

        for index = 0; index <= 7; ++index {
            let number = index + 4
            BBCategory.append(0x1 << UInt32(number))
            
            blueBlock.append(self.childNodeWithName("BlueBlock_\(index)") as! SKSpriteNode)
            blueBlock[index].physicsBody = SKPhysicsBody(texture: blueBlock[index].texture!, size: blueBlock[index].size)
            blueBlock[index].physicsBody!.usesPreciseCollisionDetection = true
            blueBlock[index].physicsBody!.categoryBitMask = BBCategory[index]
            blueBlock[index].physicsBody!.collisionBitMask = BBCategory[index] | ballCategory
            blueBlock[index].physicsBody!.contactTestBitMask = BBCategory[index] | ballCategory
            blueBlock[index].physicsBody!.dynamic = false
        }
        
        for index = 0; index <= 2; ++index {
            boundary.append(self.childNodeWithName("boundary_\(index)") as! SKSpriteNode)
            boundary[index].physicsBody = SKPhysicsBody(rectangleOfSize: boundary[index].size)
            boundary[index].physicsBody!.usesPreciseCollisionDetection = true
            boundary[index].physicsBody!.categoryBitMask = boundaryCategory
            boundary[index].physicsBody!.collisionBitMask = boundaryCategory | ballCategory
            boundary[index].physicsBody!.contactTestBitMask = boundaryCategory | ballCategory
            boundary[index].physicsBody!.dynamic = false
        }
        
        paddle = self.childNodeWithName("paddle") as! SKSpriteNode
        paddle.physicsBody = SKPhysicsBody(texture: paddle.texture!, size: paddle.size)
        paddle.physicsBody!.usesPreciseCollisionDetection = true
        paddle.physicsBody!.categoryBitMask = paddleCategory
        paddle.physicsBody!.collisionBitMask = paddleCategory | ballCategory
        paddle.physicsBody!.contactTestBitMask = paddleCategory | ballCategory
        paddle.physicsBody!.dynamic = false
        
        ball = self.childNodeWithName("ball") as! SKSpriteNode
        ball.physicsBody = SKPhysicsBody(texture: ball.texture!, size: ball.size)
        ball.physicsBody!.categoryBitMask = ballCategory
        ball.physicsBody!.usesPreciseCollisionDetection = true
        ball.physicsBody!.friction = 0.0
        ball.physicsBody!.restitution = 1
        ball.physicsBody!.velocity = CGVector(dx: 0, dy: 100)
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            paddle.position.x = location.x
            
            ball.physicsBody!.velocity = CGVector(dx: 0, dy: 100)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            paddle.position.x = location.x
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        for index = 0; index <= 7; ++index {
            if contact.bodyA.categoryBitMask == BBCategory[index] && contact.bodyB.categoryBitMask == ballCategory {
                blueBlock[index].physicsBody!.categoryBitMask = 0
                //ball.physicsBody!.angularVelocity = CGFloat(CGVector(dx: 2, dy: 2))
            }
        }
    }
}
