#!/usr/bin/env python
# encoding: utf-8
"""
google.py
Created by Indro De on 2011-03-31.
Requires gdata-2.0.14 (gdata-python-client)
http://code.google.com/p/gdata-python-client/downloads/list
This tool allows the domain admin to set vacation responder manually for any member of the organization.
run like this: python google.py {username}
"""

import sys
import os
import gdata.apps.emailsettings.client
import gdata.apps.emailsettings.service

#token
token = "hQAAADoBAACLXJcbsP1QSFvy9PU_9G0C4SF97B8mhapOoSrCGDKdxRd8M3nTBGVQWvkHJVw2IN6BpSAcM7C9o8G5XdZlzRI0KBcmNhMXJQuPLmDUWsKfe9w_npNS2UqE8uLYmuWrcz8jtwGVaUUQJfYN73FkJf2jKetUn8QZJRuZic4jNVMJej7Mjs9HX0AQwJaJnYnDJrbH9un4gkEkxuCnAfCbPZTYK126hK4OnxlhvAb1YxapggGTXH8lTi7srGLoKiE55Q6zxrRa50aVL6w2OmaT1TdNEHChZamvp1ZEy_644Wvt0Gxc7h2ugjPCZPeVPhz-A8A1MleUICZG1YFvm9_Y7XvXc4qy2yu6iAErH1aY8TRfJ0DKHQIG_I5gOE4AXDCtINrBVZRHm-769jDscAZyJ9Yw"

def main():

  u = sys.argv[1]
  e = raw_input("Enable: (true to enable; leave blank to disable): ")
  s = raw_input("Subject: ")
  m = raw_input("Message: ")
	
  # connect via token
  emailsettings = gdata.apps.emailsettings.service.EmailSettingsService(domain='indrode.com')
  emailsettings.SetClientLoginToken(token)
  
  # connect via admin account
  #emailsettings = gdata.apps.emailsettings.service.EmailSettingsService(email='admin@indrode.com', password='123456', domain='indrode.com')

  emailsettings.UpdateVacation(username=u, enable=bool(e), subject=s, message=m, contacts_only=False)
  print "Vacation Responder updated."


if __name__ == '__main__':
  main()
