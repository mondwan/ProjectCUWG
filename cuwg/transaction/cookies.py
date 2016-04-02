"""
- `File`: cookies.py

- `Description`: Transcation challenge 1: Session
"""


import webapp2
from google.appengine.ext.webapp import template
import os
import constants


class TransactionHandler(webapp2.RequestHandler):
    """Handler for /transaction/cookies
    """
    def get(self):
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'cookies.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': False,
                    }, {
                        'name': 'Transaction',
                        'href': '/transaction',
                        'active': False,
                    }, {
                        'name': 'Cookies',
                        'href': '/transaction/cookies',
                        'active': True,
                    }],
                            
                    'isSignUp': False,
                    'isLogin': True,
                    'isStarted': False
                }
            )
        )
