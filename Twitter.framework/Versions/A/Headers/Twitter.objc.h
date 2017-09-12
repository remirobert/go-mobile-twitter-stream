// Objective-C API for talking to twitter-stream-aggregator-2/twitter Go package.
//   gobind -lang=objc twitter-stream-aggregator-2/twitter
//
// File is generated by gobind. Do not edit.

#ifndef __Twitter_H__
#define __Twitter_H__

@import Foundation;
#include "Universe.objc.h"


@class TwitterConfig;
@class TwitterResponse;
@class TwitterTweet;
@class TwitterTwitter;
@protocol TwitterTwitterCallback;
@class TwitterTwitterCallback;

@interface TwitterConfig : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) id _ref;

- (id)initWithRef:(id)ref;
@end

@interface TwitterResponse : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) id _ref;

- (id)initWithRef:(id)ref;
- (NSString*)createdAt;
- (void)setCreatedAt:(NSString*)v;
- (int64_t)id_;
- (void)setID:(int64_t)v;
- (NSString*)idStr;
- (void)setIDStr:(NSString*)v;
- (NSString*)text;
- (void)setText:(NSString*)v;
- (NSString*)source;
- (void)setSource:(NSString*)v;
- (BOOL)truncated;
- (void)setTruncated:(BOOL)v;
// skipped field Response.InReplyToStatusID with unsupported type: *types.Interface

// skipped field Response.InReplyToStatusIDStr with unsupported type: *types.Interface

// skipped field Response.InReplyToUserID with unsupported type: *types.Interface

// skipped field Response.InReplyToUserIDStr with unsupported type: *types.Interface

// skipped field Response.InReplyToScreenName with unsupported type: *types.Interface

// skipped field Response.User with unsupported type: *types.Struct

// skipped field Response.Geo with unsupported type: *types.Interface

// skipped field Response.Coordinates with unsupported type: *types.Interface

// skipped field Response.Place with unsupported type: *types.Interface

// skipped field Response.Contributors with unsupported type: *types.Interface

// skipped field Response.RetweetedStatus with unsupported type: *types.Struct

- (BOOL)isQuoteStatus;
- (void)setIsQuoteStatus:(BOOL)v;
- (long)retweetCount;
- (void)setRetweetCount:(long)v;
- (long)favoriteCount;
- (void)setFavoriteCount:(long)v;
// skipped field Response.Entities with unsupported type: *types.Struct

- (BOOL)favorited;
- (void)setFavorited:(BOOL)v;
- (BOOL)retweeted;
- (void)setRetweeted:(BOOL)v;
- (BOOL)possiblySensitive;
- (void)setPossiblySensitive:(BOOL)v;
- (NSString*)filterLevel;
- (void)setFilterLevel:(NSString*)v;
- (NSString*)lang;
- (void)setLang:(NSString*)v;
- (NSString*)timestampMs;
- (void)setTimestampMs:(NSString*)v;
@end

@interface TwitterTweet : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) id _ref;

- (id)initWithRef:(id)ref;
- (NSString*)text;
- (void)setText:(NSString*)v;
- (NSString*)userName;
- (void)setUserName:(NSString*)v;
- (NSString*)userDisplayedName;
- (void)setUserDisplayedName:(NSString*)v;
- (NSString*)userImageUrl;
- (void)setUserImageUrl:(NSString*)v;
@end

@interface TwitterTwitter : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) id _ref;

- (id)initWithRef:(id)ref;
- (void)close;
- (void)startRead:(NSString*)track;
@end

@protocol TwitterTwitterCallback <NSObject>
- (void)getContent:(TwitterTweet*)response;
@end

FOUNDATION_EXPORT TwitterConfig* TwitterNewConfig(NSString* consumer, NSString* consumerSecret, NSString* token, NSString* tokenSecret);

FOUNDATION_EXPORT TwitterTwitter* TwitterNewTitter(id<TwitterTwitterCallback> callback, TwitterConfig* config);

// skipped function NewTweet with unsupported parameter or return types


@class TwitterTwitterCallback;

@interface TwitterTwitterCallback : NSObject <goSeqRefInterface, TwitterTwitterCallback> {
}
@property(strong, readonly) id _ref;

- (instancetype)initWithRef:(id)ref;
- (void)getContent:(TwitterTweet*)response;
@end

#endif