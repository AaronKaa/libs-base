#import "Testing.h"
#import "ObjectTesting.h"
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSData.h>
#import <Foundation/NSString.h>

int main()
{ 
  NSAutoreleasePool   *arp = [NSAutoreleasePool new];
  char *str1,*str2;
  NSData *data1, *data2;
  NSMutableData *mutable;
  unsigned char *hold;
  
  str1 = "Test string for data classes";
  str2 = (char *) malloc(sizeof("Test string for data classes not copied")); 
  strcpy(str2,"Test string for data classes not copied");
  
  mutable = [NSMutableData dataWithLength:100];
  hold = [mutable mutableBytes]; 
  
  /* hmpf is this correct */
  data1 = [NSData dataWithBytes:str1 length:(strlen(str1) * sizeof(void*))];
  PASS(data1 != nil &&
       [data1 isKindOfClass:[NSData class]] &&
       [data1 length] == (strlen(str1) * sizeof(void*)) &&
       [data1 bytes] != str1 &&
       strcmp(str1,[data1 bytes]) == 0,
       "+dataWithBytes:length: works");
  
  data2 = [NSData dataWithBytesNoCopy:str2 length:(strlen(str2) * sizeof(void*))];
  PASS(data2 != nil && [data2 isKindOfClass:[NSData class]] &&
       [data2 length] == (strlen(str2) * sizeof(void*)) &&
       [data2 bytes] == str2,
       "+dataWithBytesNoCopy:length: works");
  
  data1 = [NSData dataWithBytes:nil length:0];
  PASS(data1 != nil && [data1 isKindOfClass:[NSData class]] && 
       [data1 length] == 0, 
       "+dataWithBytes:length works with 0 length");
  
  [data2 getBytes:hold range:NSMakeRange(2,6)]; 
  PASS(strcmp(hold,"st str") == 0, "-getBytes:range works");
  
  TEST_EXCEPTION([data2 getBytes:hold 
                           range:NSMakeRange(strlen(str2)*sizeof(void*),1)];,
                 NSRangeException, YES, 
		 "getBytes:range: with bad location");
  
  TEST_EXCEPTION([data2 getBytes:hold 
                           range:NSMakeRange(1,(strlen(str2)*sizeof(void*)))];,
                 NSRangeException, YES, 
		 "getBytes:range: with bad length");
  
  TEST_EXCEPTION([data2 subdataWithRange:NSMakeRange((strlen(str2)*sizeof(void*)),1)];,
                 NSRangeException, YES, 
		 "-subdataWithRange: with bad location");
  
  TEST_EXCEPTION([data2 subdataWithRange:NSMakeRange(1,(strlen(str2)*sizeof(void*)))];,
                 NSRangeException, YES, 
		 "-subdataWithRange: with bad length");
  
  data2 = [NSData dataWithBytesNoCopy:str1 
                               length:(strlen(str1) * sizeof(void*))
			 freeWhenDone:NO];
  PASS(data2 != nil && [data2 isKindOfClass:[NSData class]] &&
       [data2 length] == (strlen(str1) * sizeof(void*)) &&
       [data2 bytes] == str1, 
       "+dataWithBytesNoCopy:length:freeWhenDone: works");
  
  [arp release]; arp = nil;
  
  { 
    BOOL didNotSegfault = YES;
    PASS(didNotSegfault, "+dataWithBytesNoCopy:length:freeWhenDone:NO doesn't free memory");
  }
  return 0;
}