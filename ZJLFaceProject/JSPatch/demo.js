require('UIAlertController,NSOperationQueue,NSThread');
defineClass('TestJSPatchViewController', {
			clickTestBtn: function() {
			var alert = UIAlertController.alertControllerWithTitle_message_preferredStyle("修改之后", "再试一次", 1);
			self.presentViewController_animated_completion(alert, YES, null);
			var queue = NSOperationQueue.alloc().init();
			queue.addOperationWithBlock(block(function() {
											  NSThread.sleepForTimeInterval(1);
											  alert.dismissViewControllerAnimated_completion(YES, null);
											  }));
			
			},
			});
