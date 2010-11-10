//
//  UploaderViewController.m
//
//  Created by Steven Watson on 11/8/10.
//  Copyright 2010 swatsons.com. All rights reserved.
//

#import "UploaderViewController.h"

@implementation UploaderViewController

- (IBAction)pushPick:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	[self presentModalViewController:picker animated:YES];
	[picker release];
	
	
}

- (IBAction)pushUpload:(id)sender {
	NSData *imageData = UIImageJPEGRepresentation(imageView.image, 90);
	NSString *urlString = @"http://www.thedevgeek.com/mobi/upload.php";
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
	[request addValue:contentType forHTTPHeaderField:@"Content-Type"];
	
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\".jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	 [body appendData:[NSData dataWithData:imageData]];
	  [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	   [request setHTTPBody:body];
	   
	   NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	   NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	   
	   NSLog(returnString);				  
	
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
	[picker dismissModalViewControllerAnimated:YES];
	imageView.image = image;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[picker dismissModalViewControllerAnimated:YES];	
}


@end
