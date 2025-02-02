/** Declaration of extension methods for base additions

   Copyright (C) 2025 Free Software Foundation, Inc.

   Written by:  Richard Frith-Macdonald <rfm@gnu.org>

   This file is part of the GNUstep Base Library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.
   
   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 31 Milk Street #960789 Boston, MA 02196 USA.

*/

#ifndef	INCLUDED_NSOperationQueue_GNUstepBase_h
#define	INCLUDED_NSOperationQueue_GNUstepBase_h

#import <GNUstepBase/GSVersionMacros.h>
#import <Foundation/NSOperation.h>

#if	defined(__cplusplus)
extern "C" {
#endif

#if	OS_API_VERSION(GS_API_NONE,GS_API_LATEST)

@interface NSOperationQueue (GNUstepBase)

/** Wraps a nil terminated list of objects in key/value pairs in a
 * dictionary and adds an operation to send a message to aTarget to
 * perform aSelector (which takes the map as its single argument).
 */
- (void) addOperationWithTarget: (id<NSObject>)aTarget
		performSelector: (SEL)aSelector
		        withMap: (id)firstkey, ...;

- (void) addOperationWithTarget: (id<NSObject>)aTarget
		performSelector: (SEL)aSelector
		     withObject: (id<NSObject>)object1
		     withObject: (id<NSObject>)object2
		     withObject: (id<NSObject>)object3
		     withObject: (id<NSObject>)object4;

- (void) addOperationWithTarget: (id<NSObject>)aTarget
		performSelector: (SEL)aSelector
		     withObject: (id<NSObject>)object1
		     withObject: (id<NSObject>)object2
		     withObject: (id<NSObject>)object3;

- (void) addOperationWithTarget: (id<NSObject>)aTarget
		performSelector: (SEL)aSelector
		     withObject: (id<NSObject>)object1
		     withObject: (id<NSObject>)object2;

- (void) addOperationWithTarget: (id<NSObject>)aTarget
		performSelector: (SEL)aSelector
		     withObject: (id<NSObject>)object1;

- (void) addOperationWithTarget: (id<NSObject>)aTarget
		performSelector: (SEL)aSelector;

@end

#endif	/* OS_API_VERSION */

#if	defined(__cplusplus)
}
#endif

#endif	/* INCLUDED_NSOperationQueue_GNUstepBase_h */

