//  This file was generated by LevelHelper
//  http://www.levelhelper.org
//
//  LevelHelperLoader.mm
//  Created by Bogdan Vladu
//  Copyright 2011 Bogdan Vladu. All rights reserved.
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
#import "LHJoint.h"
#import "LHSettings.h"
#import "LevelHelperLoader.h"
#import "LHSprite.h"
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface LHJoint (Private)

@end
////////////////////////////////////////////////////////////////////////////////
@implementation LHJoint
@synthesize tag;
@synthesize type;
////////////////////////////////////////////////////////////////////////////////
-(void) dealloc{		
    //NSLog(@"LH Joint Dealloc");
    if(shouldDistroyJointOnDealloc)
        [self removeJointFromWorld];

#ifndef LH_ARC_ENABLED
    [uniqueName release];
    [customUserValues release];
	[super dealloc];
#endif
}
////////////////////////////////////////////////////////////////////////////////
-(id) initWithUniqueName:(NSString *)name{
    self = [super init];
    if (self != nil)
    {
        joint = 0;
        shouldDistroyJointOnDealloc = true;
        uniqueName = [[NSString alloc] initWithString:name];
        customUserValues = [[NSMutableDictionary alloc] init];    
        tag = 0;
        type = LH_DISTANCE_JOINT;
    }
    return self;
}
////////////////////////////////////////////////////////////////////////////////
+(id) jointWithUniqueName:(NSString*)name{
#ifndef LH_ARC_ENABLED
    return [[[self alloc] initWithUniqueName:name] autorelease];
#else
    return [[self alloc] initWithUniqueName:name];
#endif
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
-(NSString*)uniqueName{
    return uniqueName;   
}
////////////////////////////////////////////////////////////////////////////////
-(void) setJoint:(b2Joint*)jt{
    NSAssert(jt!=nil, @"b2Joint must not be nil");
    joint = jt;
}
////////////////////////////////////////////////////////////////////////////////
-(b2Joint*)joint{
    return joint;
}
////////////////////////////////////////////////////////////////////////////////
-(bool) removeJointFromWorld{
    

    if(0 != joint)
	{
        b2Body *body = joint->GetBodyA();
        
        if(0 == body)
        {
            body = joint->GetBodyB();
            
            if(0 == body)
                return false;
        }
        b2World* _world = body->GetWorld();
        
        if(0 == _world)
            return false;
        
        _world->DestroyJoint(joint);
        return true;
	}
    return false;
}
////////////////////////////////////////////////////////////////////////////////
-(void) setCustomValue:(id)value withKey:(NSString*)key{
    
    NSAssert(value!=nil, @"Custom value object must not be nil");    
    NSAssert(key!=nil, @"Custom value key must not be nil");    
    
    [customUserValues setObject:value forKey:key];
}
-(id) customValueWithKey:(NSString*)key{
    NSAssert(key!=nil, @"Custom value key must not be nil");    
    return [customUserValues objectForKey:key];
}
////////////////////////////////////////////////////////////////////////////////
-(LHSprite*) spriteA{
    if(joint)
        return [LHSprite spriteForBody:joint->GetBodyA()];
        
    return nil;
}
//------------------------------------------------------------------------------
-(LHSprite*) spriteB{
    if(joint)
        return [LHSprite spriteForBody:joint->GetBodyB()];
    
    return nil;    
}
//------------------------------------------------------------------------------
+(bool) isLHJoint:(id)object
{   
    if([object isKindOfClass:[LHJoint class]]){
        return true;
    }
    return false;
}
//------------------------------------------------------------------------------
+(LHJoint*) jointFromBox2dJoint:(b2Joint*)jt
{    
    if(jt == NULL)
        return NULL;
    
    
    
#ifndef LH_ARC_ENABLED
    id lhJt = (id)jt->GetUserData();
#else
    id lhJt = ((__bridge id))jt->GetUserData();
#endif
    
    
    if([LHJoint isLHJoint:lhJt]){
        return (LHJoint*)lhJt;
    }
    
    return NULL;    
}
@end
