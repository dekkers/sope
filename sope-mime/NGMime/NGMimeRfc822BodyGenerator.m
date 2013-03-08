/*
  Copyright (C) 2000-2007 SKYRIX Software AG
  Copyright (C) 2007      Helge Hess

  This file is part of SOPE.

  SOPE is free software; you can redistribute it and/or modify it under
  the terms of the GNU Lesser General Public License as published by the
  Free Software Foundation; either version 2, or (at your option) any
  later version.

  SOPE is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
  License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with SOPE; see the file COPYING.  If not, write to the
  Free Software Foundation, 59 Temple Place - Suite 330, Boston, MA
  02111-1307, USA.
*/

#include "NGMimeBodyGenerator.h"
#include "NGMimePartGenerator.h"
#include "common.h"

@implementation NGMimeRfc822BodyGenerator

- (id<NGMimePartGenerator>)generatorForPart:(id<NGMimePart>)_part {
  id g;
  
  g = [[[NGMimePartGenerator alloc] init] autorelease];
  [g setUseMimeData:self->useMimeData];
  return g;
}

- (NSData *)generateBodyOfPart:(id<NGMimePart>)_part
  additionalHeaders:(NGMutableHashMap *)_addHeaders
  delegate:(id)_delegate
{
  NSData              *data;
  NGMimePartGenerator *gen;
  
  gen = (NGMimePartGenerator *)[self generatorForPart:_part];
  [gen setDelegate:_delegate];
  data = [gen generateMimeFromPart:[_part body]];
  return data;
}

@end /* NGMimeRfc822BodyGenerator */
