"""
- `File`: cookies.py

- `Description`: Transcation challenge 1: Session
"""


import webapp2
from google.appengine.ext.webapp import template
import os
import constants

class CookiesSignin(webapp2.RequestHandler):
    """Handler for /transaction/cookies/sid%2019900615
    """
    def get(self):
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'cookies_mary.tpl'),
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
        
class CookiesLogin(webapp2.RequestHandler):
    def post(self):
        name = self.request.get('name')
        pw = self.request.get('pw')
        
        result = False
        msg = "start "
        if name == 'mary':
            if pw == '7':
                result = True
        
        isLogin = True
        if result == True:
            isLogin = False

        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'password.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': False,
                    }, {
                        'name': 'Authentication',
                        'href': '/authentication',
                        'active': False,
                    }, {
                        'name': 'Password',
                        'href': '/authentication/password',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': isLogin,
                    'isSucceeded': result,
                    'isStarted': True

                }
            )
        )
    def get(self):
        
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'password.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': False,
                    }, {
                        'name': 'Authentication',
                        'href': '/authentication',
                        'active': False,
                    }, {
                        'name': 'Password',
                        'href': '/authentication/password',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': True,
                    'isStarted': False
                }
            )
        )



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
