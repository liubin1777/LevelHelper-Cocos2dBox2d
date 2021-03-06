//  This file was generated by LevelHelper
//  http://www.levelhelper.org
//
//  LevelHelperLoader.h
//  Created by Bogdan Vladu
//  Copyright 2011 Bogdan Vladu. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//  The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//  Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//  This notice may not be removed or altered from any source distribution.
//  By "software" the author refers to this code file and not the application 
//  that was used to generate this file.
//
////////////////////////////////////////////////////////////////////////////////

#import "LevelHelperLoader.h"

@interface LevelHelperLoader (USERS_CATEGORIES_EXTENSION) 

/*
 FOLLOWING METHODS HAVE BEEN ADDED TO HELP USERS DO COMPLEX TASKS WITH JUST
 A LINE OF CODE. IF YOU HAVE A METHOD THAT YOU WANT ADDED HERE PLEASE GIVE ME 
 A MAIL.
 */

//this will create physic boundaries based on the curret device orientation and size.
+(b2Body*) createFullScreenPhysicBoundaries:(b2World*)world; //provided for simplicity


-(bool) isSprite:(LHSprite*)sprite atPoint:(CGPoint)point;
-(bool) isSpriteWithUniqueName:(NSString*)name atPoint:(CGPoint)point;

//this will replace a sprite in the level with a NEW sprite that is also in the level file
-(void) replaceSprite:(LHSprite*)sprite withNewSpriteWithUniqueName:(NSString*)desiredSpriteUniqueName;
-(void) replaceSpriteForBody:(b2Body*)body withNewSpriteWithUniqueName:(NSString*)desiredSpriteUniqueName;
-(void) replaceSpriteWithUniqueName:(NSString*)firstName withNewSpriteWithUniqueName:(NSString*)desiredSpriteUniqueName;


@end	
