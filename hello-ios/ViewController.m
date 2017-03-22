//
//  ViewController.m
//  hello-ios
//
//  Created by John Kodumal on 10/21/15.
//  Copyright © 2015 John Kodumal. All rights reserved.
//

#import "ViewController.h"
#import "LDClient.h"


@interface ViewController () <ClientDelegate>
@property (nonatomic) LDUserModel *user;
@property (nonatomic) NSString *MOBILE_KEY_TEST;
@property (nonatomic) NSString *MOBILE_KEY_PRODUCTION;
@property (nonatomic) NSString *FLAG_KEY;
@property (nonatomic) NSString *dateString;
@property (weak, nonatomic) IBOutlet UITextField *emailAddressField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.MOBILE_KEY_TEST = @"mob-b0f1bf44-f827-43b4-ac2e-027a4faf37f8";
    self.MOBILE_KEY_PRODUCTION = @"mob-ed420f03-25dd-499d-9fec-d0e27caf9205";
    self.FLAG_KEY = @"test";

    [self setupLDClient];
    [self checkFeatureValue];
    [LDClient sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupLDClient {
    LDUserBuilder *builder = [[LDUserBuilder alloc] init];
    self.dateString = [self dateString];
    builder = [builder withKey:self.dateString];

    LDConfigBuilder *config = [[LDConfigBuilder alloc] init];
    [config withMobileKey:self.MOBILE_KEY_TEST];
    
    [[LDClient sharedInstance] start:config userBuilder:builder];
}

- (void)checkFeatureValue {
    BOOL showFeature = [[LDClient sharedInstance] boolVariation:self.FLAG_KEY fallback:NO];
    [self updateLabel:[NSString stringWithFormat:@"%d",showFeature]];
}

- (void)updateLabel:(NSString *)value {
    self.valueLabel.text = [NSString stringWithFormat:@"Flag value: %@",value];
}

- (IBAction)didTapSubmitButton:(UIButton *)sender {
    LDUserBuilder *userBuilder = [[LDClient sharedInstance] currentUserBuilder];
    userBuilder = [userBuilder withEmail:self.emailAddressField.text];
    [[LDClient sharedInstance] updateUser:userBuilder];
}

#pragma mark - ClientDelegate methods

-(void)featureFlagDidUpdate:(NSString *)key {
    if([key isEqualToString:self.FLAG_KEY]) {
        [self checkFeatureValue];
    }
}

#pragma mark - Internal methods

- (NSString *)dateString {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.MM.dd.hh:mm:ss"];

    return  [dateFormatter stringFromDate:now];
}

@end
