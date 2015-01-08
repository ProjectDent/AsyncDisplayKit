/* Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ASTextNodeTextKitHelpers.h"

@implementation ASTextKitComponents

- (instancetype)initWithTextStorage:(NSTextStorage *)textStorage
                      textContainer:(NSTextContainer *)textContainer
                      layoutManager:(NSLayoutManager *)layoutManager
{
  if (self = [super init]) {
    _textStorage = textStorage;
    _textContainer = textContainer;
    _layoutManager = layoutManager;
  }
  return self;
}

@end

#pragma mark - Convenience

ASTextKitComponents *ASTextKitComponentsCreate(NSAttributedString *attributedSeedString, CGSize textContainerSize)
{
  // Create the TextKit component stack with our default configuration.
  NSTextStorage *textStorage = (attributedSeedString ? [[NSTextStorage alloc] initWithAttributedString:attributedSeedString] : [[NSTextStorage alloc] init]);

  NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
  [textStorage addLayoutManager:layoutManager];

  NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:textContainerSize];
  textContainer.lineFragmentPadding = 0.0; // We want the text laid out up to the very edges of the text-view.
  [layoutManager addTextContainer:textContainer];

  return [[ASTextKitComponents alloc] initWithTextStorage:textStorage textContainer:textContainer layoutManager:layoutManager];
}
