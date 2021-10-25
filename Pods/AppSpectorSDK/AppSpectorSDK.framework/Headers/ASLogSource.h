//
//  ASLogSource.h
//  AppSpectorSDK
//
//  Created by Deszip on 10.08.2021.
//  Copyright © 2021 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(LogSource) typedef NSString *ASLogSource NS_TYPED_EXTENSIBLE_ENUM;
NS_SWIFT_NAME(system)  extern ASLogSource const kLogEventSourceSystem;
NS_SWIFT_NAME(user)    extern ASLogSource const kLogEventSourceUser;
