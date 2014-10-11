/* Created by Mustafa Gezen on 23.04.2014 */
#include "KeyShortcut.h"

static void reloadSettings(){
    prefs = [NSMutableDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/org.mustafaa.keyshortcut.plist"];

    if ([prefs objectForKey:@"selectAllKey"] && ![[prefs objectForKey:@"selectAllKey"] isEqualToString:@""]) {
        selectAllKey = [prefs objectForKey:@"selectAllKey"];
    } else {
        selectAllKey = @"a";
    }

    if ([prefs objectForKey:@"copyKey"] && ![[prefs objectForKey:@"copyKey"] isEqualToString:@""]) {
        copyKey = [prefs objectForKey:@"copyKey"];
    } else {
        copyKey = @"c";
    }

    if ([prefs objectForKey:@"cutKey"] && ![[prefs objectForKey:@"cutKey"] isEqualToString:@""]) {
        cutKey = [prefs objectForKey:@"cutKey"];
    } else {
        cutKey = @"x";
    }

    if ([prefs objectForKey:@"pasteKey"] && ![[prefs objectForKey:@"pasteKey"] isEqualToString:@""]) {
        pasteKey = [prefs objectForKey:@"pasteKey"];
    } else {
        pasteKey = @"v";
    }

    if ([prefs objectForKey:@"undoKey"] && ![[prefs objectForKey:@"undoKey"] isEqualToString:@""]) {
        undoKey = [prefs objectForKey:@"undoKey"];
    } else {
        undoKey = @"z";
    }

    if ([prefs objectForKey:@"redoKey"] && ![[prefs objectForKey:@"redoKey"] isEqualToString:@""]) {
        redoKey = [prefs objectForKey:@"redoKey"];
    } else {
        redoKey = @"r";
    }

    if ([prefs objectForKey:@"selectLastKey"] && ![[prefs objectForKey:@"selectLastKey"] isEqualToString:@""]) {
        selectLastKey = [prefs objectForKey:@"selectLastKey"];
    } else {
        selectLastKey = @"s";
    }

    if ([prefs objectForKey:@"beginningKey"] && ![[prefs objectForKey:@"beginningKey"] isEqualToString:@""]) {
        beginningKey = [prefs objectForKey:@"beginningKey"];
    } else {
        beginningKey = @"b";
    }

    if ([prefs objectForKey:@"endKey"] && ![[prefs objectForKey:@"endKey"] isEqualToString:@""]) {
        endKey = [prefs objectForKey:@"endKey"];
    } else {
        endKey = @"e";
    }

    if ([prefs objectForKey:@"oneKey"] && ![[prefs objectForKey:@"oneKey"] isEqualToString:@""]) {
        oneKey = [prefs objectForKey:@"oneKey"];
    }

    if ([prefs objectForKey:@"twoKey"] && ![[prefs objectForKey:@"twoKey"] isEqualToString:@""]) {
        twoKey = [prefs objectForKey:@"twoKey"];
    }

    if ([prefs objectForKey:@"threeKey"] && ![[prefs objectForKey:@"threeKey"] isEqualToString:@""]) {
        threeKey = [prefs objectForKey:@"threeKey"];
    }

    if ([prefs objectForKey:@"fourKey"] && ![[prefs objectForKey:@"fourKey"] isEqualToString:@""]) {
        fourKey = [prefs objectForKey:@"fourKey"];
    }

    if ([prefs objectForKey:@"fiveKey"] && ![[prefs objectForKey:@"fiveKey"] isEqualToString:@""]) {
        fiveKey = [prefs objectForKey:@"fiveKey"];
    }

    if ([prefs objectForKey:@"sixKey"] && ![[prefs objectForKey:@"sixKey"] isEqualToString:@""]) {
        sixKey = [prefs objectForKey:@"sixKey"];
    }

    if ([prefs objectForKey:@"sevenKey"] && ![[prefs objectForKey:@"sevenKey"] isEqualToString:@""]) {
        sevenKey = [prefs objectForKey:@"sevenKey"];
    }

    if ([prefs objectForKey:@"eightKey"] && ![[prefs objectForKey:@"eightKey"] isEqualToString:@""]) {
        eightKey = [prefs objectForKey:@"eightKey"];
    }

    if ([prefs objectForKey:@"nineKey"] && ![[prefs objectForKey:@"nineKey"] isEqualToString:@""]) {
        nineKey = [prefs objectForKey:@"nineKey"];
    }

    if ([prefs objectForKey:@"zeroKey"] && ![[prefs objectForKey:@"zeroKey"] isEqualToString:@""]) {
        zeroKey = [prefs objectForKey:@"zeroKey"];
    }

    if ([prefs objectForKey:@"atKey"] && ![[prefs objectForKey:@"atKey"] isEqualToString:@""]) {
        atKey = [prefs objectForKey:@"atKey"];
    }

    if ([prefs objectForKey:@"spaceKey"] && ![[prefs objectForKey:@"spaceKey"] isEqualToString:@""]) {
        spaceKey = [prefs objectForKey:@"spaceKey"];
    }

    selectAllKey = [selectAllKey lowercaseString];
    copyKey = [copyKey lowercaseString];
    cutKey = [cutKey lowercaseString];
    pasteKey = [pasteKey lowercaseString];
    undoKey = [undoKey lowercaseString];
    redoKey = [redoKey lowercaseString];
    selectLastKey = [selectLastKey lowercaseString];
    beginningKey = [beginningKey lowercaseString];
    endKey = [endKey lowercaseString];

    keys = @[selectAllKey, copyKey, cutKey, pasteKey, undoKey, redoKey, selectLastKey, beginningKey, endKey, @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", @"@", @" "];
}

static UITextRange *WordSelectedTextRange(id<UITextInput> delegate)
{
    BOOL hasRightText = [delegate.tokenizer isPosition:delegate.selectedTextRange.start withinTextUnit:UITextGranularityWord inDirection:UITextLayoutDirectionRight];
    UITextStorageDirection direction = hasRightText ? UITextStorageDirectionForward : UITextStorageDirectionBackward;
    UITextRange *range = [delegate.tokenizer rangeEnclosingPosition:delegate.selectedTextRange.start
        withGranularity:UITextGranularityWord
        inDirection:direction];
    if (!range) {
        UITextPosition *p = [delegate.tokenizer positionFromPosition:delegate.selectedTextRange.start toBoundary:UITextGranularityWord inDirection:UITextStorageDirectionBackward];
        range = [delegate.tokenizer rangeEnclosingPosition:p withGranularity:UITextGranularityWord inDirection:UITextStorageDirectionBackward];
    }
    return range;
}

static BOOL isTweakInstalled(NSString *name) {
    return [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/Library/MobileSubstrate/DynamicLibraries/%@.dylib",name]];
}

%hook UIKeyboardLayoutStar
    - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
        pasteboard = [UIPasteboard generalPasteboard];
        touch = [touches anyObject];
        key = [[[self keyHitTest:[touch locationInView:touch.view]] representedString] lowercaseString];

        UIKeyboardImpl *impl = [%c(UIKeyboardImpl) activeInstance];

        delegate = impl.privateInputDelegate ?: impl.inputDelegate;
        selectedString = [delegate textInRange:[delegate selectedTextRange]];

        tempDelegate = (UIResponder <UITextInput> *)delegate;

        isLongPressed = [impl isLongPress];

        if (isLongPressed) {
            // A: Select all
            if ([key isEqualToString:selectAllKey]) {
                if ([delegate respondsToSelector:@selector(selectAll:)]) {
                    [delegate selectAll:nil];

                    [impl clearTransientState];
                    [impl clearAnimations];
                    [impl setCaretBlinks:YES];

                    return;
                } else if ([delegate respondsToSelector:@selector(selectAll)]) {
                    [delegate selectAll];

                    [impl clearTransientState];
                    [impl clearAnimations];
                    [impl setCaretBlinks:YES];

                    return;
                }
            // C: Copy marked text
            } else if ([key isEqualToString:copyKey]) {
                if ([delegate respondsToSelector:@selector(selectedTextRange)]) {
                    range = [delegate selectedTextRange];
                    textRange = [delegate textInRange:range];

                    [pasteboard setString:textRange];

                    [impl clearTransientState];
                    [impl clearAnimations];
                    [impl setCaretBlinks:YES];

                    return;
                }
            // X: Cut marked text
            } else if ([key isEqualToString:cutKey]) {
                if ([delegate respondsToSelector:@selector(selectedTextRange)]) {
                    range = [delegate selectedTextRange];
                    textRange = [delegate textInRange:range];

                    [pasteboard setString:textRange];

                    [impl deleteFromInput];
                    [impl clearTransientState];
                    [impl clearAnimations];
                    [impl setCaretBlinks:YES];
                }
            // V: Paste marked text
            } else if ([key isEqualToString:pasteKey]) {
                if ([delegate respondsToSelector:@selector(selectedTextRange)]) {
                    copiedtext = [pasteboard string];

                    if (copiedtext) {
                        [impl insertText:copiedtext];
                    }

                    [impl clearTransientState];
                    [impl clearAnimations];
                    [impl setCaretBlinks:YES];

                    return;
                }
            // Z: Undo
            } else if ([key isEqualToString:undoKey]) {
                if ([[delegate undoManager] canUndo]) {
                    [[delegate undoManager] undo];

                    [impl clearTransientState];
                    [impl clearAnimations];
                    [impl setCaretBlinks:YES];

                    return;
                }
            // R: Redo
            } else if ([key isEqualToString:redoKey]) {
                if ([[delegate undoManager] canRedo]) {
                    [[delegate undoManager] redo];

                    [impl clearTransientState];
                    [impl clearAnimations];
                    [impl setCaretBlinks:YES];

                    return;
                }
            // S: Select last word
            } else if ([key isEqualToString:selectLastKey]) {
                if (!selectedString.length) {
                    UITextRange *textRange = WordSelectedTextRange(delegate);

                    if (!textRange)
                        return;

                    tempDelegate.selectedTextRange = textRange;

                    [impl clearTransientState];
                    [impl clearAnimations];
                    [impl setCaretBlinks:YES];

                    return;
                }
            // B: Beginning of document
            } else if ([key isEqualToString:beginningKey]) {
                tempDelegate.selectedTextRange = [tempDelegate textRangeFromPosition:tempDelegate.beginningOfDocument toPosition:tempDelegate.beginningOfDocument];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // E: End of document
            } else if ([key isEqualToString:endKey]) {
                tempDelegate.selectedTextRange = [tempDelegate textRangeFromPosition:tempDelegate.endOfDocument toPosition:tempDelegate.endOfDocument];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 1: One key shortcut
            } else if ([key isEqualToString:@"1"] && oneKey) {
                [impl insertText:oneKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 2: Two key shortcut
            } else if ([key isEqualToString:@"2"] && twoKey) {
                [impl insertText:twoKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 3: Three key shortcut
            } else if ([key isEqualToString:@"3"] && threeKey) {
                [impl insertText:threeKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 4: Four key shortcut
            } else if ([key isEqualToString:@"4"] && fourKey) {
                [impl insertText:fourKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 5: Five key shortcut
            } else if ([key isEqualToString:@"5"] && fiveKey) {
                [impl insertText:fiveKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 6: Six key shortcut
            } else if ([key isEqualToString:@"6"] && sixKey) {
                [impl insertText:sixKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 7: Seven key shortcut
            } else if ([key isEqualToString:@"7"] && sevenKey) {
                [impl insertText:sevenKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 8: Eight key shortcut
            } else if ([key isEqualToString:@"8"] && eightKey) {
                [impl insertText:eightKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 9: Nine key shortcut
            } else if ([key isEqualToString:@"9"] && nineKey) {
                [impl insertText:nineKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // 0: Zero key shortcut
            } else if ([key isEqualToString:@"0"] && zeroKey) {
                [impl insertText:zeroKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // @: At key shortcut
            } else if ([key isEqualToString:@"@"] && atKey) {
                [impl insertText:atKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            // Space: Space key shortcut
            } else if ([key isEqualToString:@" "] && spaceKey) {
                [impl insertText:spaceKey];

                [impl clearTransientState];
                [impl clearAnimations];
                [impl setCaretBlinks:YES];

                return;
            }
        }
        %orig;
    }

    - (void)longPressAction {
        %orig;

        UIKBTree *keyTree = (UIKBTree *)[self activeKey];
        NSString *key = [[keyTree representedString] lowercaseString];

        if ([keys containsObject:key]) {
            CGRect size;

            if (isTweakInstalled(@"PredictiveKeyboard")) {
                size = (CGRect){{10, -80}, CGSizeMake(155, 40)};
            } else {
                size = (CGRect){{10, -45}, CGSizeMake(155, 40)};
            }

            KSLabel *indicator = [[KSLabel alloc] initWithFrame:size endDuration:1.3];
            indicator.text = @"Long press occurred";
            [self addSubview:indicator];
        }
    }
%end

%ctor {
    reloadSettings();

    dlopen("/Library/MobileSubstrate/DynamicLibraries/SwipeSelection.dylib", RTLD_NOW);
    dlopen("/Library/MobileSubstrate/DynamicLibraries/SwipeSelectionPro.dylib", RTLD_NOW);
}
