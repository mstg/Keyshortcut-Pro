/* Created by Mustafa Gezen on 23.04.2014 */
#import <UIKit/UIGestureRecognizerSubclass.h>
#import <UIKit/UIKeyboardLayoutStar.h>
#import <UIKit/UIKeyboardInput.h>
#import <UIKit/UITextInput.h>
#import "KSLabel.h"

@interface UIKeyboardImpl : UIView
    + (UIKeyboardImpl*)activeInstance;
    - (BOOL)isLongPress;
    - (void)handleDelete;
    - (void)insertText:(id)text;
    - (void)clearAnimations;
    - (void)clearTransientState;
    - (void)setCaretBlinks:(BOOL)arg1;
    - (void)deleteFromInput;
    @property (readonly, assign, nonatomic) UIResponder <UITextInputPrivate> *privateInputDelegate;
    @property (readonly, assign, nonatomic) UIResponder <UITextInput> *inputDelegate;
@end

@interface UIKBShape : NSObject
@end

@interface UIKBKey : UIKBShape
    @property(copy) NSString * representedString;
@end

@interface UIKBTree
    - (id)representedString;
@end

static BOOL isLongPressed = false;
static BOOL should_work = true;
static id delegate;
static void reloadSettings();
static UIResponder <UITextInput> *tempDelegate;
static UIKeyboardImpl *impl;
static UIPasteboard *pasteboard;
static UITouch *touch;
static NSMutableDictionary *prefs;
static UITextRange *range;
static NSString *copiedtext;
static NSString *textRange;
static NSString *selectedString;
static NSString *key;
static NSString *selectAllKey;
static NSString *copyKey;
static NSString *cutKey;
static NSString *pasteKey;
static NSString *undoKey;
static NSString *redoKey;
static NSString *selectLastKey;
static NSString *beginningKey;
static NSString *endKey;
static NSString *oneKey;
static NSString *twoKey;
static NSString *threeKey;
static NSString *fourKey;
static NSString *fiveKey;
static NSString *sixKey;
static NSString *sevenKey;
static NSString *eightKey;
static NSString *nineKey;
static NSString *zeroKey;
static NSString *atKey;
static NSString *spaceKey;
static NSArray *keys;
