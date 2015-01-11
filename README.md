Tipulator
=========

Codepath iOS Course Tip Calculator Prework

The Tipulator app is designed for simplicity, allowing a user to preset two default tip percentages, default split, and default currency.

---

![tipulator.gif]

---
Process:

- Overall time to complete iOS tip calculator app (the minimum specified in the video) was about 20-25 minutes.
- Adding in and hooking up the settings page took two to three hours (my connection between SettingsViewController and my storyboard UIViewController got fouled up after changing some filepaths on disk and I ended up starting clean and porting in my previous work)
- Style and features took another few hours (most of that time was trying to figure out how to get a UIImageView into the UINavigationBar Title in XCode6 :)

That brings total time to around 3-5 hours.

---

Design decisions:

- Nobody really tips low anymore... most people will tip around 20% and bump that to 25ish for great service and they tend to have two (normal and high) values in mind. I simplified the defaults to 2 settable options to reflect that practice. I considered adding functionality to override that, but KISS.
- Not a fan of storing the last typed tip value for a period of time. That may just be me, though... Would be easy enough to store the entered NSDate and bill value in NSUser defaults before didDisappear (or maybe there's a willBackground?) and fetch it to check on willAppear or didLoad.
- had some animations, mucked up some parts, I'll get there...

---

License file intentionally omitted - full source ownership and rights maintained by creator.
