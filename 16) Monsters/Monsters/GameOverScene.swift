//
//  GameOverScene.swift
//  Monsters
//
//  Created by profesor on 18/11/22.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene{
    init(size: CGSize, won: Bool){
        super.init(size: size)
        
        backgroundColor = SKColor.white
        
        let message = won ? "Ganaste :D" : "Los monstruos te aventajaron :("
        
        let label = SKLabelNode(fontNamed: "Chalkduster")
        
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.black
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: 3.0),
            SKAction.run(){ [weak self] in
                guard let `self` = self else { return}
                
                let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                let scene = GameScene(size: size)
                self.view?.presentScene(scene, transition: reveal)
            }
        ]
        ))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
