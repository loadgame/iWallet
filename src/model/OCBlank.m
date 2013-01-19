//
//  OCBlank.m
//  OpenCoinWallet
//
//  Created by Gulliver on 15.01.13.
//  Copyright (c) 2013 Opencoin Team. All rights reserved.
//

#import "OCBlank.h"

#import "OCCurrency.h"
#import "OCMintKey.h"
#import "OCPublicKey.h"

@implementation OCBlank

- (id)initWithAttributes:(NSDictionary *)attributes
{
  self = [super init];
  if (!self) {
    return nil;
  }
  
  
  return self;
}

+(OCBlank*) blankWithCurrency:(OCCurrency*) currency
             WithDenomination: (NSInteger) denomination
                  WithMintKey: (OCMintKey*) mint_key
{
  OCBlank* blank;
  if (!currency ||!mint_key)
  {
    blank = nil;
  }
  else
  {
    blank = [[OCBlank alloc] init];
    blank.protocol_version = currency.protocol_version;
    blank.issuer_id        = currency.issuer_public_master_key.public_exponent;        // = base64(hash(public master key))
    blank.cdd_location     = currency.cdd_location;        // = http://opencent.net/OpenCent [[Hint to download the CDD if not available anyway.
                                                           // Useful for clients        to "bootstrap" a yet unknown currency.]]
    blank.denomination     = denomination;   // = integer [[Only a hint, not verified value. Denomination MUST be verified by checking the mint key's denomination.]]
    blank.mint_key_id      = @"PWk9saAOHwXgUFTEaxpZWGHRKm8pGrL9o+xS3CjEToZfooirTKVu283sGlco58VBaapgzlmCcZQo\npZqL+4sp3yeTotYfBfq1nPLgEmInsLh16uHv4GCw4xIPhME5HLM3BHp9zNvrqo3z/4a2qEZ43Qz9\nJCAlWrDo/MCE+N/GOWWQgttbhnKN9UmmYUStWW8J7sRBPUKVkubahI4eA2tkFz02oip8AxDKZd/b\na5qFPrSDmNhN3nL7pMPOmddg5FMNNbHyHxZbNvUimRcmWYNURjGTNwvNebRaoUDmd28F1QGSkCJE\nAqdZwzN0XoZ6BLJjOCWCrM2HIRL+Xp+oHGEsww==";
    
    //mint_key.public_mint_key.public_exponent;      // = base64(hash(public mint key))
    blank.serial           = @"23";           // = base64(128bit random number) [[This random value is generated by clients.
                                              // A high entropy (crypto grade quality) is important.]]
  
  }
  return blank;
}

@end