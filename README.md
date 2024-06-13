# MacOS
macOS Connection - I would highly advise BT teathering or using ethernet & micro usb donngle to connect, as this method *should* work every time but it doesn't. Setting static MAC address sometimes seems to kill connection. You can do this every time you reboot, but you might want to delete the gadgets as they come to save sanity. Note: PWNKILL does not disconnect pi, sudo reboot will!

Sharing internet with macOS can be a pain if you got Windows brain. 

This guide assumes you already installed your fav Pwnflavor on your fav Pi. Doesn't seem to matter what install you use, the method to link hardware is the same.  

Follow these steps to connect your Pwnpal to your macOS computer. Please note - just like tech, steps are probably allredy outdated & I haven't finished typing yet. 

TL;DNR - You need to share intnernet to RNDIS *first* and then you can update and save IP address. 

Step 0: You already have your Pwnpal initial install complete! 

Step 1: Plug Pwnpal intp computer, using proper working cord.

Step 2 : System Settings | Network

Step 3: You should see your RNDIS gadget in yellow. (yellow dot next to "self-assigned IP") 

Step 4: You clicked on yellow RNDIS but can't change IP address to manual! - NOBODY TOLD YOU TO CLICK IT YET. 

Step 5: Fuckouta there, search "Internet Sharing" (I type "shar" and save so much time wow go me)

Step 6: CLICK ON INTERNET SHARING - what did you think we were searching for?

Step 7: Prepare for macfuckery

Step 8: Turn internet sharing off! Toggle internet off! Whatever! Semantics! (you clicked "Internet sharing", right?)

Step 8a: "Done"

Step 8b: CLOSE SYSTEM SETTINGS

Step 9: Back to internet sharing - flip everything on! You should see your RNDIS gadget listed now. Or multiple if you have done this over and over. And over. You can delete the old ones FYI. Sharing internet = WiFi or Ethernet, however you get your internet. Probably wifi. 

Step 9a: "Done"

Step 9b: CLOSE SYSTEM SETTINGS

Step 10: System Settings | Network | click RNDIS Gadget | Details | TCP/IP = Manual | Update IP address & DNS

Step 10a: "Done"

Step 10b: CLOSE SYSTEM SETTINGS

You may need to update your Pwnpal from 10.0.0.2 to 192.168.x.2. See https://pwnagotchi.org/common-issues/index.html "New Network Address"

To mitigate this issue, you need to eject your Micro SD, and edit the file cmdline.txt on the boot partition by appending the following line to it to set a static MAC with a texteditor:

g_ether.host_addr=f8:e0:79:af:57:eb g_ether.dev_addr=f8:e0:79:af:57:eb 
